clear; clf; clc;
num = [1]; den = poly([0 -0.505 -40]);
G = tf(num, den)
H = 1;
GH = G*H;
pos = 10;
z = -log(pos/100)/sqrt(pi^2+[log(pos/100)]^2)
rlocus(GH)
sgrid(z, 0)

%{
[K,p]=rlocfind(GH)
s = tf([1 0],1)
Kvo = dcgain(K*s*GH)
esso=1/Kvo
Tso = 4/abs(real(p(2)))

%settling time yang diinginkan = 1
Tsd = 1

%Kompensasi PD
dpole= (Tso/Tsd)*p(2)
[numc,denc]=tfdata(GH,'v')
angle_at_dpole =(180/pi)*...
angle(polyval(numc, dpole)/polyval(denc, dpole))
PD_angle = 180-angle_at_dpole
zc =((imag(dpole)/tan(PD_angle*pi/180))...
-real(dpole))

Gc = tf([1 zc], 1)
Gf = GH*Gc
rlocus(Gf)
sgrid(z,0)

[Kf,pf] = rlocfind(Gf)
Tsf = 4/abs(real(pf(1)))
Kvf = dcgain(Kf*s*Gf)
essf = 1/Kvf



T=feedback(K*G,H)
Tf=feedback(Kf*Gc*G,H)

step(T)
hold on
step(Tf)

legend({'uncompensated','compensated'},'Location','southeast')
%}