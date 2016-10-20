%% Exercicio 1 - Alínea b

% Definição das variáveis
R = 50;
C = 10e-9;
L = 2e-3;

% Matrizes que definem o sistema (em espaço de estados)
A = [ -R/L -1/L ; 1/C 0];
B = [1/L 0]';
C = [R 0];
D = [0];

% Sistema de estados
% ss ->
Sys = ss(A, B, C, D);

% Vetor tempo  [0, 50] us
t = 0:0.01e-6:50e-6;

% Sinal de entrada
% 10 V, 0 <= t <= 10 us
% 0 V , no restante
u = zeros(size(t));
u(t <= 10e-6) = 10;

% Simular o sistema
figure(1)
lsim(Sys, u, t)
