# signal_processing_fpga
Modelo para procesamiento de señales en FPGAs de AMD-Xilinx. Especificamente funciona en Red Pitaya

## Estructura general del diseño
El diseño esta pensado en tres etapas, cada una programada en sendos bloques de diseño. 

El block Design principal tiene tres partes:  control, procesamiento y data_source

### Módulo de control

Este módulo gestiona la interacción del microprocesador con la FPGA. 

Puede gestionar 10 parámetros de salida (desde el uP a la FPGA) para controlar variables y 2 parametros de entrada (FPGA a uP) para que el procesamieno informe eventos.

Posee señales de Reset y Enable (salidas) para reiniciar y habilitar la operación y una entrada de Finalización para informar el fin de los cálculos.

Posee una entrada de datos streaming para llenar una memoria FIFO con espacio para 512 datos. Esta memoria se puede escribir con un clock distinto al del uP.

* Configuración actual: Filtro FIR
En la configuración actual la señal que entra al modulo de control es la procesada por el Filtro FIR.

Los parámetros se usan para determinar:
 -> Modo de decimación (promedio o descarte) y valor de decimación de las señales entrantes (procesadas)
 -> Modo de señal (simulada o ADC) y frecuencia de la onda sinusoidal generada y de la señal alimentada al DAC.
 
Para gestionar el trafico y ver los resultados desde el uP hay herramientas en la carpeta Software.

### Software 

En este directorio estan las funcionalidades para ejecutar el el uP. 

La RP debe estar conectada a través de SSH a la computadora HOST. Recomiendo poner una clave conjunta para no tener que ingresar muchas veces la clave del equipo en las transacciones.

Primero hay que setear el bitstream de la RP con el shell script set_bitstream.

Despues a través del shell script signal_procesing.sh se puede iniciar parametrizar y ver los resultados de la operación.

Este último sh en realidad se vale del programa escrito en C signal_procesing.c para configurar las cosas. En este programa esta la HAL, en la que se podría basar uno para cambiar la funcionalidad de este proyecto.
 
### Módulo de procesamiento

El módulo de procesamiento recibe las señales con una interfaz streaming (data + data_valid) y les hace algun procesamiento. 

El procesamiento es gestionado por señales de reset y enable. Una vez terminada la operación el módulo debe poner en alto la señal de finalización.

En este caso el procesamiento es un filtro FIR con coeficientes hardcodeados.

Luego del filtro se hace una decimación según parámetros provistos por el módulo de control..

Si se quiere cambiar esta funcionalidad hay que reemplazar los módulos internos de este módulo por el procesamiento deseado, respetando la interfaz de entradas y salidas.

### Módulo de data_source

Este módulo provee los datos para el procesamiento. Estos pueden venir de datos simulados o de el ADC, según parámetros gestionados por el uP.

La frecuencia de la señal generada también es gestionada por el uP.

Adicionalmente este módulo gestiona el DAC, al que envía una señal sinusoidal de fase configurable.

### POSIBLE BUG:

Por algún motivo Vivado cambia el CLOCK DOMAIN de un pin /data_source/DAC/axis_red_pitaya_dac_0/ddr_clk. 
Aca pone la ruta relativa -> /DAC/clk_wiz_0_clk_out1 (ERRONEO)
Esa hay que cambiarla a -> /data_source/DAC/clk_wiz_0_clk_out1 (CORRECTO)
Para ello seleccionar el PIN meterse en CONFIG buscar CLOCK DOMAIN y modificarlo!

### Licencia
Este proyecto cuenta con licencia conforme a los términos de la licencia MIT