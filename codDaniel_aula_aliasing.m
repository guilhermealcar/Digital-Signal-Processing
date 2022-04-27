close all
clc
clear 

fs = 1000;
Ts = 1/fs;

%Gerar a funçao continua
passo = 0.00001;
w = 2250*pi;
N = 10;
T = 2*pi/w;
t = 0:passo:N*T;
x = cos(2250*pi*t);

plot(t,x)
xlabel('tempo (s)')
ylabel('x(t)')

%%
hold all

n = 0:N-1;
x_discreto = cos(250*pi*n*Ts);
stem(n*Ts,x_discreto, 'r')

%%
x_alias = cos(250*pi*t);
plot(t,x_alias, 'k--')

n = 0:10;