clear; clf; clc;
numg = [1]; deng = [1 2 2];
numh = 1; denh = [1 5];
G = tf(numg, deng)
H = tf(numh, denh)
Gt = G*H
pos = 10;
z = -log(pos/100)/sqrt(pi^2+[log(pos/100)]^2)
rlocus(Gt)
sgrid(z, 0)

%{
[K,p]=rlocfind(Gt)
s=tf('s')
Kpo = dcgain(K*G)
esso=1/Kpo

%Kompensasi 3 kali
dpole=3*p(2)
[numc,denc]=tfdata(Gt,'v')
angle_at_dpole =(180/pi)*...
angle(polyval(numc, dpole)/polyval(denc, dpole))
PD_angle = 180-angle_at_dpole
zc =((imag(dpole)/tan(PD_angle*pi/180))...
-real(dpole))

Gc = tf([1 zc], 1)
Gf = Gt*Gc
rlocus(Gf)
sgrid(z,0)

[Kf,pf] = rlocfind(Gf)
Kpf = dcgain(Kf*Gf)
essf = 1/Kpf

%step
T=feedback(K*Gt,H)
Tf=feedback(Kf*Gf,H)

step(T)
hold on
step(Tf)

Tso = 4/abs(real(p(2)))
Tsc = 4/abs(real(pf(2)))
%}