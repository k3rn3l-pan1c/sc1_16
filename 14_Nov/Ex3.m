%% Alinea a) - Verificar o regime de operação do sistema
clear; clc; close;

% Definir a variável função de transferência
s = tf('s');

% Função de transferência
G = 10 / (s^2 - 10*s + 100);

% Reposta ao degrau numa janela temporal de 2 segundos
figure(1)
step(G, 2)

% O sistema é instável
%% Alínea b.ii)
% O sistema foi colocado numa malha de realimentação, sendo K um parametro
% ajustável. Projete K para que a step response tenha o pico em t = 0.4 s

 % tempo para atingir o valor de pico
tp = 0.4;      

% Fator de amortecimento
E = sqrt(1 - (pi / (0.4 * 10))^2 );


% Valor do K em função do fator de amortecimento (retirado da função de
% transferencia)
K = 2 * E + 1

% Função de transferência em função do K
G = 10 / (s^2 + 10*(K - 1)*s + 100);

% Resposta do sistema ao degrau    
figure(2)
step(G)

%% Alinea b.iv) 
% Desenhe no plano complexo o movimento dos pólos do sistema realimentado à
% medida que K varia

% Variação do k
k = [-10 : 0.01 : 10]';

% pólos da função de transferência (zeros do denominador)
p1 = -5 * (k-1) + 5*sqrt(k.^2 - 2*k - 3);
p2 = -5 * (k-1) - 5*sqrt(k.^2 - 2*k - 3);

figure(3)
plot(real(p1), imag(p1), real(p2), imag(p2))
title('Movimentção dos pólos do sistema realimentado à medida que k varia');
xlabel('Re');
ylabel('Im');
legend('Pólo 1', 'Pólo 2');
axis equal
