close all
clear
clc

fs = 4;                     % Freq de amostragem
f = 1;                      % Freq = 1
T = 1/f;                    % Periodo = 1/freq
Ts = 1/fs;
N = 8;                      % Tamanho da amostra(8)
n = 0:N-1;                  % Índices dos valores de x
x = cos(2*pi*n*Ts);         % Sequencia de 8 elementos
w0 = 2*pi*f;                % Freq angular
wi = n*w0;                  % Freq em cada um dos índices do vetor

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
%%

% Matriz DFT 8x8 com laço de repetição
F1 = dft(8);
Fk = (1/N)*F1*x';

%%
geraGrafico(wi,X)


%%
y1 = fft(x);
y2 = x*dftmtx(N);
y3 = F*x';

norm(y1-y2)
norm(y1-y3)

%%
% Alterando os parâmetros conforme a tabela pt1
fs = 4;                     % Freq de amostragem
f = 0.5;                    % Freq = 0.5
T = 1/f;                    % Periodo = 1/freq
Ts = 1/fs;
N = 8;                      % Tamanho da amostra(8)
n = 0:N-1;                  % Índices dos valores de x
x = cos(2*pi*n*Ts);         % Sequencia de 8 elementos
w0 = 2*pi*f;                % Freq angular
wi = n*w0;                  % Freq em cada um dos índices do vetor

figure
stem(n,x,'k','filled')
xlabel('n')
ylabel('x[n]')
title('Sequência discreta represenante do sinal')
grid on
geraGrafico(wi,X)

%%
% Alterando os parâmetros conforme a tabela pt1
fs = 8;                     % Freq de amostragem
f = 1;                      % Freq = 1
T = 1/f;                    % Periodo = 1/freq
Ts = 1/fs;
N = 8;                      % Tamanho da amostra(8)
n = 0:N-1;                  % Índices dos valores de x
x = cos(2*pi*n*Ts);         % Sequencia de 8 elementos
w0 = 2*pi*f;                % Freq angular
wi = n*w0;                  % Freq em cada um dos índices do vetor

figure
stem(n,x,'k','filled')
xlabel('n')
ylabel('x[n]')
title('Sequência discreta represenante do sinal')
grid on
geraGrafico(wi,X)

%%
% Alterando os parâmetros para 100

fs2 = 100;                  % Freq de amostragem
f2 = 1;                     % Freq = 1
T2 = 1/f;                   % Periodo = 1/freq
Ts2 = 1/fs2;
N100 = 100;                 % Tamanho da amostra(100)
n100 = 0:N100-1;            % Índices dos valores de x
x100 = cos(2*pi*n100*Ts);   % Sequencia de 100 elementos
w02 = 2*pi*f2;              % Freq angular
wi2 = n100*w02;             % Freq em cada um dos índices do vetor

% Matriz DFT 100x100 com laço de repetição
F100 = dft(100);
X100 = (1/N100)*F100*x100';

geraGrafico(wi2,X100)

%%
N75 = 75;
F75 = dft(75);
n75 = 0:N75-1;            % Índices dos valores de x
x75 = cos(2*pi*n75*Ts);   % Sequencia de 75 elementos
X75 = (1/N75)*F75*x75';
wi2 = n75*w02;             % Freq em cada um dos índices do vetor

geraGrafico(wi2,X75)

%%
Y1 = fft(x100);
Y2 = x100*dftmtx(N100);
Y3 = F100*x100';

norm(Y1-Y2)
norm(Y1-Y3)

%%
% Função para a dft
function Ffunc = dft(A)
    Ffunc = zeros(A);
    for k=1:A
        for i=1:A
            Ffunc(k,i) = exp(-1i*(k-1)*(i-1)*2*(pi/A));
        end
    end
end

% Função para geração dos gráficos
function geraGrafico(WI,FF)
    figure
    subplot(2,1,1)
    stem(WI,abs(FF), 'filled', 'b')
    grid on
    title('Magnitude - |X[k]|')
    xlabel('\Omega')
    ylabel('|X[k]|')
    
    subplot(2,1,2)
    stem(WI,angle(FF), 'filled', 'r')
    grid on
    title('Fase - arg\{X[k]\}')
    xlabel('\Omega')
    ylabel('arg\{X[k]\}')
end