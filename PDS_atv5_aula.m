close all
clc
clear

fsA = 20;
fsB = 200;
fsC = 50;
fsD = 500;
fsE = 100;
fsF = 1000;

TsA = 1/fsA;
TsB = 1/fsB;
TsC = 1/fsC;
TsD = 1/fsD;
TsE = 1/fsE;
TsF = 1/fsF;

% Função continua
passo = 0.00001;
w = 2*pi*60;
T = 2*pi/w;
N = 150*10^(-3)/T;
t = 0:passo:N*T;
x = 127*sqrt(3)*sin(2*pi*60*t);

plot(t,x)
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')