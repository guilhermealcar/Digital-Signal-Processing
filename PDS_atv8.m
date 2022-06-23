close all
clear
clc

%%
load dado_bruto_-_com_rotulo_de_tempo.mat

N = length(t);          % Amostra = 1000
Fs = 1000;              % Freq de amostragem dada
xfreq = abs(fft(x));

Ni = 0:(N-1)/2;
omega = Ni*Fs/N;

figure
plot(t,x)
title('Original Signal')
xlabel('Time - (s)')
ylabel('Amplitude')

%%
% Plotando o sinal no espectro da freq

figure
stem(xfreq(1:end/2))
title('Original Signal')
xlabel('Frequency - (Hz)')
ylabel('Magnitude')

%%
% Amplicando filtro 

fc = 150;               % Frequencia de corte
wc = 150*(2*pi/Fs);     % Freq de corte discreta
deltaW = 10*(2*pi/Fs);  % Faixa de transição
N2 = 4.6*pi/deltaW;      % N com janela Blackman

w2 = window(@blackman, N2);

stem(w2)
%%
% Para ordem par
n = -N2/2:N2/2;
h = sinc(wc * n/pi) * wc/pi;

stem(h)

%%
b = w2.*h';
stem(b)

%%
fvtool(b,1);
xfilt = conv(x,b,"same");

%%
figure
hold all
plot(x)
plot(xfilt)
legend('Original Signal', 'Filtered Signal')
xlabel('Time - (s)')
ylabel('Amplitude')

%%
xfreqFilt = abs(fft(xfilt));

figure
stem(xfreqFilt(1:end/2))
title('Filtered Signal')
xlabel('Frequency - (Hz)')
ylabel('Magnitude')
