clear; clc; clf;
num = 1.5*10^(-2); den = poly([-0.3 -0.5]);
G = tf(num,den)

step(G)
