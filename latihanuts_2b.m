clear; clf; clc;
numg = [1 1]; deng = poly([0 -2]);
numh = 1; denh = [1 3];
G = tf(numg, deng)
H = tf(numh, denh)
Gt = G*H
pos = 10;
z = -log(pos/100)/sqrt(pi^2+[log(pos/100)]^2)
rlocus(Gt)
sgrid(z, 0)

%{
[K,p]=rlocfind(Gt)
s = tf([1 0],1)
Kvo = dcgain(K*s*Gt)
esso=1/Kvo

%Kompensasi lead 4 kali
dpole=4*p(1)

%kemudian cancel untuk (s+2)
zc = 2;
[numt,dent]=tfdata(Gt,'v')
numc = [1 zc];

angle_at_dpole =(180/pi)*...
angle(polyval(numc, dpole)/polyval(dent, dpole))
PD_angle = 180-angle_at_dpole
pc = (imag(dpole)+(abs(real(dpole))...
*tan(PD_angle*pi/180)))/tan(PD_angle*pi/180)

denc = [1 pc];

Gc = tf(numc, denc)
Gf = Gt*Gc
rlocus(Gf)
sgrid(z,0)

[Kf,pf] = rlocfind(Gf)
Kvf = dcgain(Kf*s*Gf)
essf = 1/Kvf

T=feedback(K*G,H)
Tf=feedback(Kf*Gc*G,H)

step(T)
hold on
step(Tf)

legend({'uncompensated','compensated'},'Location','southeast')
%}