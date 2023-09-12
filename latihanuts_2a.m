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

%Kompensasi 4 kali
dpole=4*p(1)
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
Kvf = dcgain(Kf*s*Gf)
essf = 1/Kvf

T=feedback(K*G,H)
Tf=feedback(Kf*Gc*G,H)

step(T)
hold on
step(Tf)

legend({'uncompensated','compensated'},'Location','southeast')
%}