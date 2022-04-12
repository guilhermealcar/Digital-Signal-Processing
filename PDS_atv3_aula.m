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