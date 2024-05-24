
#///// ========================== signal_processing.SH ================================== /////
#///// ================================================================================= /////

#
# Script para calcular lockin en la FPGA y mostrar resultados
# Uso -> lockin N_ma frec_dac frec_ref data_sel decimator decimator_method IP 

ip=${1:-192.168.1.102}

scp ../c_program/signal_processing.c root@$ip:/root/c_programs 


ssh root@$ip <<EOF

	cd /root/c_programs 
	gcc signal_processing.c -o signal_processing -lm
	./signal_processing
EOF

scp root@$ip:/root/c_programs/resultados_adc.dat ../datos_adquiridos/resultados_adc.dat

#read -p "Presione cualquier tecla para salir..."
