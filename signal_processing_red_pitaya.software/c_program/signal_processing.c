

///// ======================== signal_processing.c ============================= /////
///// ========================================================================== /////


#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <stdlib.h>
#include "string.h"
#include <time.h>
#include <math.h>

#define START_ADDRESS 0x40000000

#define ENABLE_ADDRESS 0x41230000
#define RESET_ADDRESS 0x41230008
#define FINISH_ADDRESS 0x41210000

#define FIFO_1_ADDRESS 0x43c00000

#define PARAM_IN_0 0x41200000
#define PARAM_IN_1 0x41200008

#define PARAM_OUT_0_ADDRESS 0x41220000
#define PARAM_OUT_1_ADDRESS 0x41220008
#define PARAM_OUT_2_ADDRESS 0x41240000
#define PARAM_OUT_3_ADDRESS 0x41240008
#define PARAM_OUT_4_ADDRESS 0x41250000
#define PARAM_OUT_5_ADDRESS 0x41250008
#define PARAM_OUT_6_ADDRESS 0x41260000
#define PARAM_OUT_7_ADDRESS 0x41260008
#define PARAM_OUT_8_ADDRESS 0x41270000
#define PARAM_OUT_9_ADDRESS 0x41270008

#define DECIMATOR_METHOD_ADDRESS PARAM_OUT_0_ADDRESS
#define DECIMATE_VALUE_ADDRESS PARAM_OUT_1_ADDRESS
#define SEL_DATA_IN_ADDRESS PARAM_OUT_2_ADDRESS
#define PHASE_SEN_ADDRESS PARAM_OUT_3_ADDRESS
#define PHASE_DAC_ADDRESS PARAM_OUT_4_ADDRESS

#define PI 3.1415

void setEnable(void *cfg);
void ClearEnable(void *cfg);
void ResetFPGA(void *cfg);
uint32_t getFinish(void *cfg);

void set_decimator_method(void *cfg,uint32_t decimator_method);			// 0: DECIMACION COMUN ---- 1: PROMEDIO LINEAL
void set_decimator_value(void *cfg,uint32_t decimator_value);	
void set_sel_data_in(void *cfg,uint32_t sel_data_in);					// 0: SENO INTERNO ---- 1: ADC
double set_frec_sen_interno(void *cfg,uint32_t frec_sen_interno);
double set_frec_dac(void *cfg,uint32_t frec_dac);

int32_t* leerFIFO(void *cfg,int fifo_address);
void escribirArchivo_adc(const char* nombreArchivo, int32_t* valores);


int main(int argc, char **argv)
{
    int fd;
    void *cfg;
    char *name = "/dev/mem";

	// Mapeo el espacio de memoria de la FPGA al puntero cfg
    if((fd = open(name, O_RDWR)) < 0)
    {
        perror("open");
        return 1;
    }
	cfg = mmap(NULL, 0x4000000, PROT_READ|PROT_WRITE, MAP_SHARED, fd, START_ADDRESS);
	
	// Seteo los parametros de la operacion a traves de funciones por prolijidad
	
	set_decimator_method(cfg,0);
	set_decimator_value(cfg,20);
	set_sel_data_in(cfg,1);
	set_frec_dac(cfg,250000);
	set_frec_sen_interno(cfg,500000);
	

	ResetFPGA(cfg);
	setEnable(cfg);

	
	// Espero a la señal de finzalizacion
	
	while  ( getFinish(cfg) == 0 ) 	{}
	
	int32_t* datos =  leerFIFO(cfg,FIFO_1_ADDRESS);
	
	escribirArchivo_adc("resultados_adc.dat",datos);


	ClearEnable(cfg);
	ResetFPGA(cfg);
	
    munmap(cfg, sysconf(_SC_PAGESIZE));
	

    return 0;
}


void setEnable(void *cfg)
{
	// Seteo el enable (o trigger)
	*(uint32_t *)(cfg+ ENABLE_ADDRESS - START_ADDRESS ) = 1;		
	
}

void ClearEnable(void *cfg)
{
	// Seteo el enable (o trigger)
	*(uint32_t *)(cfg+ ENABLE_ADDRESS - START_ADDRESS ) = 0;		
	
}

// Reset activo en bajo
void ResetFPGA(void *cfg)
{
	// Reseteo la cosa
	*(uint32_t *)(cfg+ ENABLE_ADDRESS - START_ADDRESS ) = 0;
	*(uint32_t *)(cfg+ RESET_ADDRESS - START_ADDRESS ) = 0;
	*(uint32_t *)(cfg+ RESET_ADDRESS - START_ADDRESS ) = 1;
	
}


void set_decimator_method(void *cfg,uint32_t decimator_method)
{
	// Seteo el metodo de decimacion
	*(uint32_t *)(cfg+ DECIMATOR_METHOD_ADDRESS - START_ADDRESS) = decimator_method ;
}

void set_decimator_value(void *cfg,uint32_t decimator_value)
{
	// Seteo el valor de decimacion
	*(uint32_t *)(cfg+ DECIMATE_VALUE_ADDRESS - START_ADDRESS) = decimator_value ;
}

void set_sel_data_in(void *cfg,uint32_t sel_data_in)
{
	// Seteo la entrada de fuente de datos
	*(uint32_t *)(cfg+ SEL_DATA_IN_ADDRESS - START_ADDRESS) = sel_data_in ;
}


double set_frec_sen_interno(void *cfg,uint32_t frec_sen_interno)
{
	// Seteo la cantidad de muestras por ciclo de señal
	int32_t phase = 2.1474 * frec_sen_interno; 
	*(uint32_t *)(cfg+ PHASE_SEN_ADDRESS - START_ADDRESS) = phase ;
	return (double)phase*125000000/(pow(2,28));

}

double set_frec_dac(void *cfg,uint32_t frec_dac)
{
	// Seteo la cantidad de muestras por ciclo de señal
	int32_t phase = 2.1474 * frec_dac; 
	*(uint32_t *)(cfg+ PHASE_DAC_ADDRESS - START_ADDRESS) = phase ;
	return (double)phase*125000000/(pow(2,28));

}


uint32_t getFinish(void *cfg)
{
	return *((uint32_t *)(cfg+ FINISH_ADDRESS - START_ADDRESS) );
}

// Funciones para leer los FIFO.. esta los toma como FIFOS independientes
int32_t* leerFIFO(void *cfg,int fifo_address)
{
	int i = 0;
	int32_t * data ;
	data = (int32_t *)malloc(514 * sizeof(int32_t));
	for (i=0;i<514;i++)
	{	
		int32_t read = *((int32_t *)(cfg+ fifo_address - START_ADDRESS + 0x20) );
		*(data+i) = read;
		
	}
	return data;
}

void escribirArchivo_adc(const char* nombreArchivo, int32_t* valores)
{
	FILE *archivo;
    archivo = fopen(nombreArchivo, "w");
    if (archivo == NULL) {
        printf("Error al abrir el archivo.");
        return;
    }

	fprintf(archivo, "Valores del ADC: \n\n");

	for(int i = 0; i<512;i++)
	{
		if(i!=511){
			fprintf(archivo, "%d, ", *(valores+i));
		}else{
			fprintf(archivo, "%d", *(valores+i));
		}
		
	}
}

