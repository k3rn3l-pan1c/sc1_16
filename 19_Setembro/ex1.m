%% Aula 2 - 19 Setembro
clear; clc; close;

%% Teste da toolbox de controlo
% tf -> declara uma variácel do tipo funçao de transferência, sendo
% passados os polinómios do numerador e denominador.
% Se definirmos uma variável função de transferência, todas as expressões
% que usarem essa variável serão também objetos função de transferência
s = tf('s');

% Função transferência do sistema
Gs = 1/(s+2)^2;

%% Resposta a um degrau unitário - Método 1
% step -> determina a resposta ao degrau unitário de uma função de
% transferência.
% Quando chamada sem argumentos de retorno, a função step chama a função
% stepplot e efetua o plot da step response do sistema
figure(1)
step(Gs)

%% Resposta a um degrau unitário - Método 2
% Quando chamada com um argumento de retorno, a função step devolve a
% resposta em frequencia do sistema
y = step(Gs);
figure(2)
plot(y)
title('Resposta ao degrau unitário');
ylabel('Amplitude');
xlabel('Samples');

%% Resposta a um degrau unitário - Método 3
% Quando chamada com dois argumentos de retorno, a função step devolve o
% vetor temporal considerado no cálculo da resposta do sistema ao degrau
% unitário
[y, t] = step(Gs);
figure(3)
plot(t, y)
title('Resposta ao degrau unitário');
ylabel('Amplitude');
xlabel('Tempo (s)');

%% Resposta a um degrau unitário - Método 4
% Quando chamada com dois argumentos, o 2º argumento no caso de ser um
% valor escalar é o tempo máximo de simulação em segundos
[y, t] = step(Gs, 20);
figure(4)
plot(t, y)
title('Resposta ao degrau unitário');
ylabel('Amplitude');
xlabel('Tempo (s)');
    
%% Resposta a um degrau unitário - Método 5
% Quando chamada com 2 argumentos, no qual o 2º argumento é um vetor, a
% funçao step considera o 2º argumento como o vetor temporal na qual
% calcula a resposta da step function
y = step(Gs, t);
figure(5)
plot(t, y);
title('Resposta ao degrau unitário');
ylabel('Amplitude');
xlabel('Tempo (s)');

