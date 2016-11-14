clc; clear;

Po = 20;
tr = 50e-6;

L = 0.1e-3;

E = sqrt(log(Po/100)^2 / (log(Po/100)^2 + pi^2))

wn = (0.8 + 2.5 * E) / 50e-6

C = 1 / (L * wn^2)

R = 2 * E * sqrt(L / C)

%% 

s = tf('s');
G = (1 / (s^2 + R/L*s + 1/(L*C)))

step(G)
