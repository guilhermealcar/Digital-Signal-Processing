%% Atv1
clear
clc
close all

w = 0.1*pi; % freq angular
T = 0.1;    % Periodo
n = 0:60;   % n amostras
fs = 1;     % freq amostragem
N = -60:60; % N amostras

%% Ex1

figure
hold all

% Função fornecida no problema
x1 = 3*cos(n * pi / 2) + sin(n * pi / 5);

% Definindo os indices a serem separados
id1 = n <= 20;
id2 = (n > 20) & (n <= 40);
id3 = (n > 40) & (n <= 60);

% Plotando com cada periodo de cada cor
stem(n(id1), x1(id1), 'fill', '-b');
hold on;
stem(n(id2), x1(id2), 'fill', '-r');
stem(n(id3), x1(id3), 'fill', '-g');

% Titulo e labels
title('Sinal em tempo discreto de x[n]');
subtitle('Cada periodo de 20 amostras com uma cor diferente');
xlabel('n');
ylabel('x[n]');

hold off;

%%
figure
h = w/pi*sinc(w*N/pi);
%Sendo n um vetor de -W:W em que W é o tamanho da janela.

conv(x1,h,'same');
stem(N,h);
hold on;

% Aplicando filtro passabaixas
h_passabaixas = lowpass(h, 0.005, fs, 'ImpulseResponse', 'iir', 'Steepness', 0.5);
conv(x1,h_passabaixas,'same');
stem(N,h_passabaixas);

legend({'Impulso','Impulso com passa-baixas'});
title('Resposta ao impulso de h[n]');
xlabel('n');
ylabel('h[n]');

%%
figure
x2 = sin(w*n*2);

subplot(2, 1, 1);
hold all;
plot(n+1,x1, 'r-O');
plot(n,x2, 'black--o');

legend({'Original','Ideal'});
title('Sinal ideal em relacao ao original');
xlabel('n');
ylabel('x[n]');


% Filtrado ideal junto com filtrado
convolucao = conv(x1, h, 'same');

subplot(2, 1, 2);
hold all;
plot(n,x2, 'black--o');
plot(n, convolucao, 'b-o');

legend({'Ideal','Filtrado'});
title('Sinal filtrado em relacao ao ideal');
xlabel('n');
ylabel('x[n]');
