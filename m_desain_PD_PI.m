num = [1 8]; den = poly([-3 -6 -10]);
G = tf(num,den);
rlocus(G)
pos = 20
z = (-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
sgrid(z,0)
[K,p] = rlocfind(G)

%peak time
dpole = 1.5*p(1)
angle_at_dpole =(180/pi)*angle(polyval(num,dpole)/polyval(den,dpole))
PD_angle = 180-angle_at_dpole
zc =((imag(dpole)/tan(PD_angle*pi/180))-real(dpole))
GPD=tf([1 zc],1)

GPI = tf([1 0.5], [1 0])
rlocus(GPD*GPI*G)
sgrid(z,0)
[K,p]=rlocfind(GPD*GPI*G)

TPID = feedback(K*GPD*GPI*G,1)
step(TPID)
Tp=pi/imag(p(1))
Ts=4/real(p(1))