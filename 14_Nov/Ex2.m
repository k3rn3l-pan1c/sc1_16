%% Circuito RLC da aula de 7 de Novembro (continuação)
clear; clc; close;

% Parametros
C = 10e-6;      % Capacidade do condensador
L = 0.1e-3;     % Indutância da bobine
E = 1;          % constante de amortecimento (Criticamente Amortecido)

R = 2 * E * sqrt(L/C);  % Resistência sabendo o amortecimento desejado

%% Alínea C - Visualizar a resposta ao degrau para R, 2R, R/2
% Variável função de transferência
s = tf('s');

% Função de trensferência para R = R (Criticamente Amortecido)
G1 = (1/(s^2 + R/L*s + 1/(L*C)));

% Função de trensferência para R = 2R (Sobre Amortecido)
G2 = (1/(s^2 + 2*R/L*s + 1/(L*C)));

% Função de trensferência para R = R/2 (Sub Amortecido)
G3 = (1/(s^2 + R/2/L*s + 1/(L*C)));

% Resposta dos 3 sistemas ao degrau unitário
figure(1)
step(G1, G2, G3)
legend('G1 - Criticamente Amortecido (R)', 'G2 - Sobre Amortecido (2R)', ...
    'G3 - Sub Amortecido (R/2)');

%% Alínea d)
% Com L = 0.1 mH, determinar R e C para PO = 20% e tr = 50 us, para uma
% resposta ao degrau 

Po = 20;        % Percentagem de Overshoot
tr = 50e-6;     % Rise Time
L = 0.1e-3;     % Indutância desejada

% Fator de amortecimento em função da percentagem de overshot
E = sqrt(log(Po/100)^2 / (log(Po/100)^2 + pi^2));

% Frequencia de amortecimento em função do fator de amortecimento e do
% tempo de subida
wn = (0.8 + 2.5 * E) / 50e-6;

% Valor da capacidade obtido através da frequencia de de amortecimento
C = 1 / (L * wn^2);

% Valor da resistencia obtido através do fator de amortecimento
R = 2 * E * sqrt(L / C);

% Simulação da resposta ao degrau
G = (1 / (s^2 + R/L*s + 1/(L*C)));

figure(2)
step(G)

