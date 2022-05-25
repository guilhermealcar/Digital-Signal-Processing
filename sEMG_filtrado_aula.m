x = sEMG_200g;
fs = 1000;
Ts = 1 / fs; %período de amostragem
N = length(x); %número de amostras
T = (N-1)*Ts; % tempo total em seg.

%tempo = 0 até T, com espaçamento de Ts
t = 0:Ts:T;


figure
hold all
F = abs(fft(x));
Ni = 0:(N-1)/2;
omega = Ni*fs/N;
plot(omega,F(1:end/2));

Rp = 1;
Rs = 40;
Ws = 2*5/fs;
Wp = 2*20/fs;
[N,Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a]=butter(4,0.0316,'high');
x_filtrado = filtfilt(b,a,x);
FF = abs(fft(x_filtrado));
plot(omega,FF(1:end/2),'Color',[0.7 0.7 0.7])
ylim([0 0.1])
xlabel('frequency (Hz)')
ylabel('Magnitude')

figure
subplot(2,1,1)

plot(t,x,'k');
xlabel('tempo (segundos)')
ylabel('Amplitude do sinal - sEMG')
title('Sinal Bruto (Raw)')
subplot(2,1,2)

plot(t,x_filtrado,'k');
xlabel('tempo (segundos)')
ylabel('Amplitude do sinal - sEMG')
title('Sinal Filtrado')

figure
x_filtrado_fitDesigner = filtfilt(Num,Den,x);
FF2 = abs(fft(x_filtrado_fitDesigner));
plot(omega,FF2(1:end/2))
ylim([0 0.1])
xlabel('frequency (Hz)')
ylabel('Magnitude')

figure
plot(t,x_filtrado_fitDesigner);
xlabel('tempo (segundos)')
ylabel('Amplitude do sinal - sEMG')
title('Sinal com filtro do Filter Designer')