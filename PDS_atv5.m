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

%% Função continua
passo = 0.00001;
w = 2*pi*60;
T = 2*pi/w;
N = 150*10^(-3)/T;
t = 0:passo:N*T;
x = 127*sqrt(3)*sin(2*pi*60*t);

%% Função discreta A
% n pontos/ciclo = T/Ts
nA = 0:ceil(N*T/TsA);

% Discreto: t -> n*Ts
x_discreto_A = 127*sqrt(3)*sin(2*pi*60*nA*TsA);

%% Função discreta B
% n pontos/ciclo = T/Ts
nB = 0:ceil(N*T/TsB);

% Discreto: t -> n*Ts
x_discreto_B = 127*sqrt(3)*sin(2*pi*60*nB*TsB);

%% Função discreta C
% n pontos/ciclo = T/Ts
nC = 0:ceil(N*T/TsC);

% Discreto: t -> n*Ts
x_discreto_C = 127*sqrt(3)*sin(2*pi*60*nC*TsC);

%% Função discreta D
% n pontos/ciclo = T/Ts
nD = 0:ceil(N*T/TsD);

% Discreto: t -> n*Ts
x_discreto_D = 127*sqrt(3)*sin(2*pi*60*nD*TsD);

%% Função discreta E
% n pontos/ciclo = T/Ts
nE = 0:ceil(N*T/TsE);

% Discreto: t -> n*Ts
x_discreto_E = 127*sqrt(3)*sin(2*pi*60*nE*TsE);

%% Função discreta F
% n pontos/ciclo = T/Ts
nF = 0:ceil(N*T/TsF);

% Discreto: t -> n*Ts
x_discreto_F = 127*sqrt(3)*sin(2*pi*60*nF*TsF);

%% Plot Aliasing
figure

% A
subplot(2,3,1)
plot(t,x, "k--")
hold on
title("Ts = 0.05")
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')
stem(nA*TsA, x_discreto_A, 'r', 'filled')
hold off

% B
subplot(2,3,4)
plot(t,x, "k--")
hold on
title("Ts = 0.02")
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')
stem(nB*TsB, x_discreto_B, 'r', 'filled')
hold off

% C
subplot(2,3,2)
plot(t,x, "k--")
hold on
title("Ts = 0.01")
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')
stem(nC*TsC, x_discreto_C, 'r', 'filled')
hold off

% D
subplot(2,3,5)
plot(t,x, "k--")
hold on
title("Ts = 0.005")
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')
stem(nD*TsD, x_discreto_D, 'r', 'filled')
hold off

% E
subplot(2,3,3)
plot(t,x, "k--")
hold on
title("Ts = 0.002")
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')
stem(nE*TsE, x_discreto_E, 'r', 'filled')
hold off

% F
subplot(2,3,6)
plot(t,x, "k--")
hold on
title("Ts = 0.001")
xlabel('tempo (s) t = n*Ts')
ylabel('x(t)')
stem(nF*TsF, x_discreto_F, 'r', 'filled')
hold off