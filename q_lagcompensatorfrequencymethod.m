clear; clf; clc;
num = 100; den = poly([ 0 -36 -100]);
G = tf(num, den)
pos = 9.5;
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
Pm = atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
w = 0.01:0.01:1000;
[M,P] = bode(G, w);
Ph = -180+Pm
index = find(P<=Ph)
k = index(1)
w(k)
%{
atau 
k = find(P<=Ph, 1)
%}
K = 1/M(k)