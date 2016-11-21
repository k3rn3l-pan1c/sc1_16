%% Considere o seguinte sistema de controlo onde p é um parametro ajustável
% Pretende-se que este sistema presente e_ss = 4 quando r(t) = t^2

clear; close all; clc;

ess1 = 4;
%% Alinea a) Determine os polos
%% Alinea b) Verique no Matlab
% Definir a variável função de transferência
s = tf('s');

% pólo do sistema
p = ess1 / 2;

% Função de transferência do caminho para a frente
G1 = (s+1) / (s^2*(s+p));

% Vetor de tempo
t = 0:0.01:100;

% Sinal de entrada no domínio do tempo
r = t.^2;

% Inserir o sistema numa malha de realimentação com feedback negativo e
% unitáio
Fs = feedback(G1, 1, -1);

% Simular o comportamento do sistema realimentado ao sinal de entrada
% (parábola) nos instantes de tempo definidos
y = lsim(Fs, r, t);

% Evolução da saída e da entrada ao longo do tempo
figure(1)
plot(t, y, t, r)
title('Saída do sistema vs Entrada do sistema');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Saída', 'Entrada');
% O sinais parecem coincidir na totalidade, mas esse efeito só se verifica
% porque as escalas são demasaido elevadas

% Calcular o vetor de erro e visualizar
e = r - y';

% Erro em função do tempo
figure(2)
plot(t, e)
title('Erro entre a saída do sistema em relação à entrada')
xlabel('t (s)');
ylabel('Erro');


%% Alinea c) Determine os polos do sistema para esse valor de p
% COeficientes do polinomio
% [ax^3 bx^2 cx d]
poliCoef = [1 p 0 0];

% Raízes do polinmio
Gpoles = roots(poliCoef)

%% Alinea d) Repita para ess = 2
% Erro em regime estacionário
ess2 = 2;

% pólo do sistema
p = ess2 / 2;
% FUnção de transferência do caminho para a frente
G2 = (s+1) / (s^2*(s+p));

% Inserir o sistema numa malha de realimentação com feedback negativo e
% unitáio
Fs = feedback(G2, 1, -1);

% Simular o comportamento do sistema realimentado ao sinal de entrada
% (parábola) nos instantes de tempo definidos
y = lsim(Fs, r, t);

% Evolução da saída e da entrada ao longo do tempo
figure(3)
plot(t, y, t, r)
title('Saída do sistema vs Entrada do sistema');
xlabel('Tempo (s)');
ylabel('Amplitude');
legend('Saída', 'Entrada');
% O sinais parecem coincidir na totalidade, mas esse efeito só se verifica
% porque as escalas são demasaido elevadas

% Calcular o vetor de erro e visualizar
e = r - y';

% Erro em função do tempo
figure(4)
plot(t, e)
title('Erro entre a saída do sistema em relação à entrada')
xlabel('t (s)');
ylabel('Erro');
% O Erro e 2, mas corresponde à média do sinal oscilat+ório

% Determine os polos do sistema para esse valor de p
% Coeficientes do polinomio
% [ax^3 bx^2 cx d]
poliCoef = [1 p 0 0];

% Raízes do polinmio
Gpoles = roots(poliCoef)
