%% Motor DC de ímanes permanentes ao qual foi acoplada uma carga de inércia JL

% Parametros
Ra = 1.3;       % Resistência do circuito elétrico
La = 0.2;       % Indutância do circuito elétrico
D = 0.1;        % Atrito do eixo de rotação
Va = 10;        % Tensão de alimentação do motor DC
Km = 1;         % Constante do motor
Kg = 0.1;       % Constante do motor
Jm = 1;         % Inércia do eixo do motor
JL = 0.1;       % Inéricia da carga
J = JL + Jm;    % Inércia total

% Entradas
TL = 5;         % Torção da carga

%% Space State
A = [-Ra/La -Kg/La ; Km/J -D/J];
B = [1/La 0 ; 0 -1/J];
C = [0 60/(2*pi) ; 1 0];
D = [0 0 ; 0 0];

% Considere que no arranque a carga está em vazio e que, 50 segundos após o
% arranque, a carga entra em esforço com TL(t) = 5 Nm, constante
% Observe em simultaneo w e ia.
