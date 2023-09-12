num = [1 6]; den = poly([-2 -3 -5]);
H=1;
G=tf(num, den)
GH=G*H;
GH=G;
rlocus(GH)
z = 0.707;
sgrid(z, 0)

%{
[K,p]=rlocfind(GH)
Ts_1 = 4/abs(real(p(2)))
Tp_1 = pi/abs(imag(p(2)))
Kp_1 = K/5
%}

%{
compensator
dpole = 2*p(2)
angle_at_dpole =(180/pi)*...
angle(polyval(num,dpole)/polyval(den,dpole))
PD_angle = 180-angle_at_dpole
zc =((imag(dpole)/tan(PD_angle*pi/180))...
-real(dpole))

Gc = tf([1 zc], 1)
Gt = G*Gc
rlocus(Gt)
sgrid(z,0)
[K1,p1] = rlocfind(Gt)

Ts_2 = 4/abs(real(p1(2)))
Tp_2 = pi/abs(imag(p1(2)))
Kp_2 = K1/5

Tc=feedback(K*Gt,1)
step(Tc)
hold on

T=feedback(K*G,1)
step(T)

s=tf('s')
Kv=dcgain(K*s*Gt)
ess = 1/Kv


%}