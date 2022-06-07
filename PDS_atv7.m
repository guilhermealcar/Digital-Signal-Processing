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
plot(noisySignal)
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

Nveg = length(Y);
Fveg = abs(fft(Y));
Niveg = 0:(N-1)/2;
omegaveg = Niveg*FS/Nveg;

figure
subplot(3,2,1)
plot(Y)
title('Original Signal')

subplot(3,2,2)
plot(omegaveg,Fveg(1:end/2))

% Recorded audio file filtered
Y_filtrado = filter(Hdveg1, Y);
Y_filtradoTransform = abs(fft(Y_filtrado));

Fveg2 = abs(fft(Y_filtrado));

p3 = audioplayer(Y_filtrado,FS);

subplot(3,2,3)
plot(Y_filtrado)
title('Filtered Signal')

subplot(3,2,4)
plot(omegaveg,Fveg2(1:end/2))

% Recorded audio file filtered - 2
Y_filtrado2 = filter(Hdveg2, Y_filtrado);
Y_filtradoTransform2 = abs(fft(Y_filtrado2));

Fveg3 = abs(fft(Y_filtrado2));

p4 = audioplayer(Y_filtrado2,FS);

subplot(3,2,6)
plot(omegaveg,Fveg3(1:end/2))
title('Filtered Signal')