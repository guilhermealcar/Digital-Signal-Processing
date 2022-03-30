% Série de Fourier

close all
clc
clear

Nw = 20;        % periodo
w = 2*pi/Nw;    % freq angular

w1 = 5*w;
w2 = 2*w;

n = 0:Nw-1;
x = 3*cos(n*w1) + sin(n*w2);

N = length(x);
w0 = 2*pi/N;

figure

subplot(3,2,[1,3])
stem(n, x, 'fill', '-k')
title('Sinal Senoidal')
xlabel('t = n*Fs (s)')
ylabel('x[n]')
%hold off
hold all


for k=0:N-1
    soma = 0;
    for n=0:N-1
        soma = soma + x(n+1)*exp(-j*w0*k*n);
    end
    X(k+1) = soma;
end

angX = angle(X);
angX = angX.*(abs(X)>0.01);


subplot(3,2,2)
stem(abs(X), 'fill', '-r')
title('Magnitude')
xlabel('k(w=k*w0);w0=2*pi/N')
ylabel('|X(jw)|')

subplot(3,2,4)
stem(angX, 'fill', '-b')
title('Fase')
xlabel('k(w=k*w0);w0=2*pi/N')
ylabel('argX(jw)')
% 
% F = ifourier(x)
% subplot(3,2,[5,6])
% stem(F)
