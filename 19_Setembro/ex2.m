%% Exercicio 2
clear; clc; close;

%% c) Visualizar a resposta ao degrau
% Variável função de transferência
s = tf('s');

% Parametros do sistema
R = 10;
L = 1e-3;
C = 10e-6;

% Função de transferencia
G = (s/(R*C)) /(s^2 + 1/(R*C)*s + 1/(L*C));

% Reposta do sistema
figure(1)
step(G)

%% d) Observar a resposta a sinusoides de frequencias distintas e determinar a frequencia de ressonancia
% Vetor de frequencias
f0 = logspace(1, 4, 2e3);

% Sampling frequency
fa = 4 * max(f0);

% Resposta em frequencia (amplitude máxima)
ampResponse = zeros(1, length(f0));

for k = 1:length(f0)
    % Time vector
    t = 0:1./fa:1./f0(k); 
    
    % System Response
    y = lsim(G, sin(2*pi*f0(k)*t), t);
    
    % Max amplitude of response
    ampResponse(k) = max(y);
    
end;

figure(2)
plot(f0, ampResponse)
title('Resposta do sistema a sinusoides');
ylabel('Amplitude');
xlabel('Frequencia (Hz)');

[y, x] = max(ampResponse);
fprintf('A frequencia de resonância do sistema é %d\n', f0(x));


% frequencia de ressonancia esperada
f_ressonance = 1/(2*pi*sqrt(L*C))

figure(3)
bode(G, 2*pi*f0);

% Através da observação do diagrama de bode verifica-se que a frequencia de
% ressonância do circuito (máximo da função de transferência) se encontra
% aproximadamente em 10e4 Hz, como seria de esperar.

