num = 1; den = poly([0 -4 -6]);
G = tf(num, den)
pos = 16;
z = (-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(G)
sgrid(z,0)
[K,p] = rlocfind(G)

dpole = 3*p(2)
angle_at_dpole =(180/pi)*...
angle(polyval(num,dpole)/polyval(den,dpole))
PD_angle = 180-angle_at_dpole
zc =((imag(dpole)/tan(PD_angle*pi/180))...
-real(dpole))

Gc = tf([1 zc], 1)
Gt = G*Gc
rlocus(Gt)
sgrid(z,0)
[K,p] = rlocfind(Gt)

Tc=feedback(K*Gt,1)
step(Tc)

s=tf('s')
Kv=dcgain(K*s*Gt)
ess = 1/Kv
