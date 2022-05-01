close all
clc
clear

%% Simbólico %%
syms n x h;
sympref('HeavisideAtOrigin',1)    % Seta o heaviside com inicio em 0

%% Sinal x[n]
x = (1/2).^n*heaviside(n);    % Heaviside = degrau (u[n])
X = ztrans(x);

% Plot do sinal x[n]
figure
subplot(2,3,[1,3])
fplot(n, x)
title('Sinal Simbólico x[n]')
xlabel('')
ylabel('x[n]')

%% Sinal h[n]
h = 0.5* kroneckerDelta(n) + kroneckerDelta(n-1) + 0.5*kroneckerDelta(n-2);     % kroneckerDelta = impulso unitario (delta[n])
H = ztrans(h);

% Plot do sinal h[n]
subplot(2,3,[4,6])
fplot(n, h)
title('Sinal Simbólico h[n]')
xlabel('')
ylabel('h[n]')

%% Transformadas
X
H
Y = H * X;

% figure
% subplot(3,3,[1,3])
% fplot(H)
% title('Gráfico de H = ztrans(h)')
% 
% subplot(3,3,[4,6])
% fplot(X)
% title('Gráfico de X = ztrans(x)')
% 
% subplot(3,3,[7,9])
% fplot(Y)
% title('Gráfico da convolução de H e X (Y)')

%% Coeficientes da função de transferência
[num,den] = numden(Y);
n = sym2poly(num);
d = sym2poly(den);
n
d

%% Resposta do sistema a partir do impulso
Y_tf = filt(n,d);
[y_out,t] = impulse(Y_tf);
[y_out,t]

figure
stem(t,y_out,'fill')
title('Gráfico do sistema a partir do impulso')
xlabel('t')
ylabel('y_{out}')

%% Mapa de polos e zeros
figure
pzmap(Y_tf)

%% Numérico %%
Nw = 30;            % Periodo
n = 0:Nw-1;

h = [0.5 1 0.5];
x = (0.5).^n;

%% Convolução
y = conv(x, h, "same");

figure
stem(y, 'fill')
title('Convolução entre x e h (y)')
xlabel('')
ylabel('')

%% Ex2 %%
% Equação do diagrama de blocos
% y[n] = x[n] + 1.3y[n-1] - 0.91y[n-2] + 0.183y[n-3]
% Y(n) = X(z) + 1.3z^(-1)Y(z) - 0.91z^(-2)Y(z) + 0.183z^(-3)Y(z)
% H(z) = Y(z)/X(z) -> Y=1 // X = [1 -1.3 0.91 -0.183]
Y = 1;
X = [1 -1.3 0.91 -0.183];
H = filt(Y,X);
H

%% Com entrada ao impulso e entrada degrau
figure;
subplot(2,1,1);
stem(impulse(H), 'filled');
title('Gráfico com entrada de impulso');
ylabel('Amplitude');

subplot(2,1,2);
stem(step(H), 'filled');
title('Gráfico com entrada de degrau');
ylabel('Amplitude');