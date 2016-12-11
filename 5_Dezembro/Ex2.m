%% Exercício 2
% Obter o valor de k para o limiar de estabilidade

clear; clc; close all;

% Definir a variável função de transferência
s = tf('s');

% Função de transferência da planta
G = 1/(s * (s+7));

% Função de transferência da malha de realimentação
H = 1/(s+11);

% usar o sisotool
sisotool('rlocus', G, 1, H, 1)

% Através do sisotool confirmarmos que o ganho no limiar de estabilidade é
% aproximadamente 1.37e+03, o que está de acordo com os valores teóricos
% esperados
