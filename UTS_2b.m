clear; clf; clc;
num = 1; den = poly([0 -3 -6]);
%sebelum kompensasi
G = tf(num,den)
%Hanya menggunakan G karena feedback H bernilai 1
pos = 10
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
rlocus(G);
sgrid(z,0);

%{
[K,p] = rlocfind(G)
s=tf('s')
Kvo = dcgain(K*G*s)
esso = 1/(1+Kvo)

%setelah kompensasi
zcpc = 10;
pc = 0.01;
zc = pc * zcpc

%lag compensator
numc = [1 zc]; denc = [1 pc];
Gc = tf(numc,denc)
Gt = G*Gc
rlocus(Gt);
sgrid(z,0);

[Kt,pt] = rlocfind(Gt)
Kvt = dcgain(Kt*Gt*s)
esst = 1/(1+Kvt)

%step input
T = feedback(K*G,1)
step(T)
hold on
Tt = feedback(Kt*Gt,1)
step(Tt);

%ramp input
t = [0:0.1:10];

T = feedback(K*G,1)
step(T/s, t)
hold on
Tt = feedback(Kt*Gt,1)
step(Tt/s, t)

Tso = 4/abs(real(p(2)))
Tsc = 4/abs(real(pt(2)))
%}
