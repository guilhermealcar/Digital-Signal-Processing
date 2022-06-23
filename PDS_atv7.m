clear
clc
close all

%% a)
% Realizando a filtragem de um audio da base de dados (train_0db)

[noisySignal,Fs] = audioread('sp12_train_sn0.wav');

p1 = audioplayer(noisySignal,Fs);
play(p1)

N = length(noisySignal);
F = abs(fft(noisySignal));
Ni = 0:(N-1)/2;
omega = Ni*Fs/N;

% Aplicando o filtro

y_filtrado = filter(Hd, noisySignal);
y_filtradoTransform = abs(fft(y_filtrado));

p2 = audioplayer(y_filtrado,Fs);
play(p2)

F2 = abs(fft(y_filtrado));

figure
subplot(2,2,1)
plot(Y)
title('Original Signal')
xlabel('Time - (s)')
ylabel('Amplitude')

subplot(2,2,2)
plot(omega,F(1:end/2))
title('Original Signal')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

subplot(2,2,3)
plot(y_filtrado)
title('Lowpass Filtered Signal')
xlabel('Time - (s)')
ylabel('Amplitude')

subplot(2,2,4)
plot(omega,F2(1:end/2))
title('Lowpass Filtered Signal')
xlabel('Frequency (Hz)')
ylabel('Magnitude')

%% b)
% Filtering a recorded audio file

load audio_gravado.mat

figure
subplot(2,1,1)
plot(Y)
title('Original Signal')

subplot(2,1,2)
plot(Y_filtrado)
title('Filtered Signal')