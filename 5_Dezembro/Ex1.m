%% Exercício 1
% Lugar de Raízes do sistema realimentado usando o sisotool

clear; clc; close all;

% Variável função de transferência
s = tf('s');

% Função de transferência da planta
Gs = (s+2) / (s * (s -1));

% Sisotool 
% 'rlocus' -> root locus plot - lugar de raízes do sistema
sisotool('rlocus', Gs)
