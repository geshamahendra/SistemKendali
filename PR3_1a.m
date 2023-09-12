clear; clf; clc;
num = 1; den = poly([-1 -5 -10]);
G = tf(num, den)
pos = 15;
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
Pm = atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
w = 0:0.01:1000;
[M,P] = bode(G, w);
Ph = -180+Pm
k = find(P<=Ph, 1)
M(k) 
K = 1/M(k)
T = feedback(K*G, 1)
step(T)
