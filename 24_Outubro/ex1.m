%% Exercício 1.e)
% Simule a evolução de x2 e x1 quando a entrada é um pulso retangular com
% duty-cycle de 50% e período de 0.3 seg, com 0.2 de amplitude

clear; clc; close;

% Parametros dos sistemas
M1 = 300;       % Massa 1
M2 = 25;        % Massa 2
k1 = 5000;      % Constante elástica da mola 1
k2 = 30000;     % Constante elástica da mola 2
d = 2500;       % Coeficiente de amortecimento
g = 9.81;       % Gravidade

% Espaço de estados
A = [0 1 0 0; -k1/M1 -d/M1 k1/M1 d/M1; 0 0 0 1; k1/M2 d/M2 -(k1+k2)/M2 -d/M2];
B = [0 0 0 k2/M2]';
C = [1 0 0 0 ; 0 0 1 0];
D = [0 ; 0];

%% Visualizar o X1 e X2 e a entrada -> Necessário usar o simulink Ex1_entrada
A = [0 1 0 0; -k1/M1 -d/M1 k1/M1 d/M1; 0 0 0 1; k1/M2 d/M2 -(k1+k2)/M2 -d/M2];
B = [0 0 0 k2/M2]';
C = [1 0 0 0; 0 0 1 0];
D = [0 ; 0];

%% Visualizar o X1 e X2 com gravidade -> Necessário usar o simulink Ex1_gravidade
A = [0 1 0 0; -k1/M1 -d/M1 k1/M1 d/M1; 0 0 0 1; k1/M2 d/M2 -(k1+k2)/M2 -d/M2];
B = [0 0 0 k2/M2; 0 g 0 g]';
C = [1 0 0 0 ; 0 0 1 0];
D = [0 0 ; 0 0 ];
