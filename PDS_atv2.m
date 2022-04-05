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

% Plot do sinal senoidal
subplot(3,2,[1,3])
stem(n, x, 'fill', '-k')
title('Sinal Senoidal')
xlabel('t = n*Fs (s)')
ylabel('x[n]')
hold all


% for k=0:N-1
%     soma = 0;
%     for n=0:N-1
%         soma = soma + x(n+1)*exp(-j*w0*k*n);
%     end
%     X(k+1) = soma;
% end

%%
% Uma outra alternativa para transformada de Fourier
% Fast Fourier Transform
X = fft(x);
X_norm = 1/N * X;

% Calculando o angulo
angX = angle(X_norm);
angX = angX.*(abs(X_norm)>0.01);

% Plot da magnitude
subplot(3,2,2)
stem(abs(X_norm), 'fill', '-r')
title('Magnitude')
xlabel('k(w=k*w0);w0=2*pi/N')
ylabel('|X(jw)|')

% Plot da fase
subplot(3,2,4)
stem(angX, 'fill', '-b')
title('Fase')
xlabel('k(w=k*w0);w0=2*pi/N')
ylabel('argX(jw)')

% Reconstroi o sinal com k frequencias dominantes
X_recon = X;
k = 4;
for i = (k+2):(N-k)
    X_recon(i) = 0;
end

% Transformada inversa
X_recon = ifft(X_recon);

% Plot do sinal reconstruído a partir da transformada inversa
subplot(3,2,[5,6])
stem(X_recon, 'fill')
title('Sinal reconstruido')
xlabel('n')
ylabel('y[n]')