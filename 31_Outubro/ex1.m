%% Exercíco 1 - Alinea d)
% Simule o sistema fluídico considerando que o caudal de entrada é
% constante (Q)
clear; clc; close;

% Parameters
A1 = 3.14;      % Area da base do 1º tanque  [m^2]
A2 = 0.79;      % Area da base do 2º tanque  [m^2]
R1 = 100000;    % Resistencia fluidica 1
R2 = 200000;    % Resistencia fluidica 2
Q = 0.1;        % Caudal de entrada
p = 1000;       % Densidade volúmica da água [Kg/m^3]
g = 9.8;        % Aceleração gravítica       [m/s^2]

% Space State Representation
A = [-p*g / (R1 * A1) 0 ; p*g/(R1*A2) -p*g/(R2*A2)];
B = [1/A1 0]';
C = [1 0 ; 0 1 ; p*g/R1 0 ; 0 p*g/R2];
D = [0 0 0 0]';
