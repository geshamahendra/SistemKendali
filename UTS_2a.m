clear; clf; clc;
%sebelum kompensasi
num = 1; den = poly([0 -3 -6]);
G = tf(num, den)
%Hanya menggunakan G karena feedback H bernilai 1
pos = 10;
z = (-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(G)
sgrid(z, 0)

%{
[K,p]=rlocfind(G)
s=tf('s')
Kvo = dcgain(K*G*s)
esso = 1/(1+Kvo)

%kompensasi 10%
numc = [1 0.1]; denc = [1 0];
Gc = tf(numc, denc)
Gt = Gc*G
rlocus(Gt)
sgrid(z, 0)

[Kc,pc] = rlocfind(Gt)
Kv = dcgain(Kc*Gt*s)
ess = 1/(1+Kv)

%ramp input
t = [0:0.1:10];
T = feedback(K*G,1)
step(T/s, t)
hold on

Tc = feedback(Kc*Gt,1)
step(Tc/s, t)

legend({'uncompensated','compensated'},'Location','southeast')

%step input
s=tf('s')
T = feedback(K*G,1)
step(T)
hold on

Tc = feedback(Kc*Gt,1)
step(Tc)

Tso = 4/abs(real(p(2)))
Tsc = 4/abs(real(pc(2)))
%}

