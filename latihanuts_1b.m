clear; clf; clc;
%sebelum komppensasi
num = 1; den = poly([-2 -4 -6]);
G = tf(num, den)
pos = 10;
z = (-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(G)
sgrid(z, 0)

%{
[K,p]=rlocfind(G)
Kpo = dcgain(K*G)
esso = 1/(1+Kpo)

%kompensasi 10%
numc = [1 0.1]; denc = [1 0];
Gc = tf(numc, denc)
Gt = Gc*G
rlocus(Gt)
sgrid(z, 0)

[Kc,pc] = rlocfind(Gt)
Kp = dcgain(Kc*Gt)
ess = 1/(1+Kp)

s=tf('s')
T = feedback(K*G*s,1)
step(T)
hold on

Tc = feedback(Kc*Gt*s,1)
step(Tc)

legend({'uncompensated','compensated'},'Location','southeast')

Tso = 4/abs(real(p(2)))
Tsc = 4/abs(real(pc(2)))

pole(G)
pole(Gt)
%}

