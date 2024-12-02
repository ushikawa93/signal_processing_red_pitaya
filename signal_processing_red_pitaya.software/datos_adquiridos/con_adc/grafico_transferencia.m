% Inicializa los valores de x
x_values = 0.5:0.5:8;
x_values = [0.05, 0.1, 0.2, x_values];

% Prealoca un vector para almacenar las amplitudes
amplitudes = zeros(size(x_values));

% Recorre los valores de x y procesa cada archivo
for i = 1:length(x_values)
    % Genera el nombre del archivo correspondiente
    filename = sprintf('resultados_adc_%0.2fM.dat', x_values(i));
    
    % Abre el archivo para lectura
    fid = fopen(filename, 'r');
    if fid == -1
        error('No se pudo abrir el archivo: %s', filename);
    end
    
    % Lee y descarta la línea de encabezado
    header = fgetl(fid);

    % Lee los datos numéricos del archivo
    data = textscan(fid, '%f', 'Delimiter', ',');
    data =  (cell2mat(data) / 8.192);

    % Cierra el archivo
    fclose(fid);

    % Calcula la amplitud aproximada (máximo - mínimo / 2)
    amplitudes(i) = (max(data) - min(data)) / 2;
end

amplitudes = 500 / amplitudes(1) .* amplitudes;

% Encuentra el nivel de -3dB
amplitude_max = max(amplitudes);
threshold_3db = amplitude_max / sqrt(2);

% Encuentra la frecuencia más cercana al nivel -3dB
[~, idx_3db] = min(abs(amplitudes - threshold_3db));
frequency_3db = x_values(idx_3db);

%% Obtiene la función de transferencia teórica
h = fir1(32, 0.05); % Coeficientes del filtro FIR pasa-bajas
fs=125e6;
[H, freq_hz] = freqz(h, 1, 1024, fs); % Respuesta en frecuencia
freq_mhz = freq_hz / 1e6; % Convierte a MHz
H_magnitude = abs(H) * (500 / max(abs(H))); % Escala para coincidir con la amplitud máxima

% Grafica las amplitudes en función de x
figure;
semilogx(x_values, amplitudes, '-ko', 'LineWidth', 1.5);
hold on;

% Grafica la función de transferencia teórica
semilogx(freq_mhz, H_magnitude, '--k', 'LineWidth', 1.5);

% Marca la frecuencia de -3dB
plot(frequency_3db, amplitudes(idx_3db), 'ko', 'MarkerSize', 15, 'LineWidth', 2);
text(frequency_3db+0.5, amplitudes(idx_3db)+30, sprintf('  %.2f MHz', frequency_3db), 'FontSize', 10);

% Configuración del gráfico
xlim([0.05, 8]);
ylim([0, 550]);
xlabel('Frecuencia (MHz)');
ylabel('Amplitud (mV)');
grid on;
legend('Amplitud medida', 'Función de transferencia teórica', '-3 dB','Location','Southwest');
hold off;

% Exportación para publicación
publicationPrint6(gcf, 26, [], 'Funcion_transferencia_RP', 'png', 18);