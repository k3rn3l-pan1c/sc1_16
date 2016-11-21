%% Ex1 - Sistema de controlo realimentado onde K é um parametro ajustável
clear; clc; close all;

%% Alinea c) 
% Para que valor de K o sistema responde ao degrau com PO = 30%. Verifique
% no MATLAB

% Definição da variável função de transferência
s = tf('s');

% Função de transferência do bloco a controlar
Gs = 1/(s^2 + 4*s + 2);

% Valor do ganho proporcional para uma sobre-elevação de 30%
k = 29.2;

% Inserir o sistema numa malha de realimentação negativa com ganho de malha
% -1
% USAGE: feedback(Ganho do caminho para a frente, ganho da malha de
% realimentação, tipo de feedback [+/-])
Fs = feedback(k * Gs, 1, -1);

% Verificar a resposta do sistema realomentado ao degrau
step(Fs)

