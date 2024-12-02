% Abre el archivo para lectura
fid = fopen('resultados_adc.dat', 'r');

% Lee la l�nea de encabezado y desc�rtala
header = fgetl(fid);

% Lee los valores del ADC desde el archivo
valores_adc = textscan(fid, '%f', 'Delimiter', ',');

% Cierra el archivo
fclose(fid);

% Convierte los datos le�dos en una matriz
valores_adc = cell2mat(valores_adc);

% Grafica los valores del ADC
plot(valores_adc);
title('Valores del ADC');
xlabel('Muestras');
ylabel('Valor del ADC');
grid on;
hold on;
