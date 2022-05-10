close all
clear
clc

x = [-1 0 1 0 -1 0 1 0];
N = length(x);
w0 = 2*pi/N;
n = 0:N-1;
wi = n*w0;

figure
stem(n,x,'k','filled')
xlabel('n')
ylabel('x[n]')
title('Sequência discreta represenante do sinal')
grid on

%%

% Matriz DFT 8x8 com valores calculados manualmente
F = [1 1 1 1 1 1 1 1;
    1 exp(-1i*pi/4) exp(-1i*pi/2) exp(-1i*3*pi/4) exp(-1i*pi) exp(-1i*5*pi/4) exp(-1i*3*pi/2) exp(-1i*2*pi);
    1 exp(-1i*pi/2) exp(-1i*pi) exp(-1i*3*pi/2) exp(-1i*2*pi) exp(-1i*5*pi/2) exp(-1i*3*pi) exp(-1i*7*pi/2);
    1 exp(-1i*3*pi/4) exp(-1i*3*pi/2) exp(-1i*9*pi/4) exp(-1i*3*pi) exp(-1i*15*pi/4) exp(-1i*9*pi/2) exp(-1i*21*pi/4);
    1 exp(-1i*pi) exp(-1i*2*pi) exp(-1i*3*pi) exp(-1i*4*pi) exp(-1i*5*pi) exp(-1i*6*pi) exp(-1i*7*pi);
    1 exp(-1i*5*pi/4) exp(-1i*5*pi/2) exp(-1i*15*pi/4) exp(-1i*5*pi) exp(-1i*25*pi/4) exp(-1i*15*pi/2) exp(-1i*35*pi/4);
    1 exp(-1i*3*pi/2) exp(-1i*3*pi) exp(-1i*9*pi/2) exp(-1i*6*pi) exp(-1i*15*pi/2) exp(-1i*9*pi) exp(-1i*21*pi/2);
    1 exp(-1i*2*pi) exp(-1i*7*pi/2) exp(-1i*21*pi/4) exp(-1i*7*pi) exp(-1i*35*pi/4) exp(-1i*21*pi/2) exp(-1i*49*pi/4)];

X = (1/N)*F*x';

figure
subplot(2,1,1)
stem(wi,abs(X), 'filled', 'b')
grid on
title('Magnitude - |X[k]|')
xlabel('\Omega')
ylabel('|X[k]|')

subplot(2,1,2)
stem(wi,angle(X), 'filled', 'r')
grid on
title('Fase - arg\{X[k]\}')
xlabel('\Omega')
ylabel('arg\{X[k]\}')

%%
y1 = fft(x);
y2 = x*dftmtx(N);
y3 = F*x';

norm(y1-y2)
norm(y1-y3)