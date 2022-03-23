%%
clear
clc
close all

w = 0.1*pi; % freq angular
T = 0.1;    % Periodo
n = 0:60;  % n amostras

N = -60:60 % N amostras

%%
figure
hold all

x1 = 3*cos(n * pi / 2) + sin(n * pi / 5)
x2 = sin(w*n*2);

subplot(2, 1, 1)
hold all
plot(n+1,x1, 'r-o')
plot(n,x2, 'black--o')

legend({'Original','Ideal'})
xlabel('n')
ylabel('x[n]')

subplot(2, 1, 2)
hold all
plot(n,x2, 'black--o')

legend({'Original','Ideal'})
xlabel('n')
ylabel('x[n]')
%%
figure
h = w/pi*sinc(0.1*pi*N/pi)
%Sendo n um vetor de -W:W em que W é o tamanho da janela.

conv(x1,h,'same')

plot(N,h)


