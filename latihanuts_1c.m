clear; clf; clc;
num = 1; den = poly([-2 -4 -6]);

%sebelum kompensasi
G = tf(num,den)
pos = 10
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
rlocus(G);
sgrid(z,0);

%{
[K,p] = rlocfind(G)
Kpo = dcgain(K*G)
esso = 1/(1+Kpo)

%setelah kompensasi
Kpn = 20;
zcpc = Kpn/Kpo
pc = 0.01;
zc = pc * zcpc

%lag compensator
numc = [1 zc]; denc = [1 pc];
Gc = tf(numc,denc)
Gt = G*Gc
rlocus(Gt);
sgrid(z,0);

[Kt,pt] = rlocfind(Gt)
Kpt = dcgain(Kt*Gt)

Tt = feedback(Kt*Gt,1)
T = feedback(K*G,1)
step(T)
hold on
step(Tt);

legend({'uncompensated','compensated'},'Location','southeast')
%}
