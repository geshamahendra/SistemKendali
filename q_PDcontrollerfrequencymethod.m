clear; clf; clc; 
K = 40*36;
num = 100; den = poly([-100 -36 0]);
G = tf(num, den)
GK = K*G

pos = 20;
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
Tp = 0.1; %peak time
wn = pi/(Tp*sqrt(1-z^2));
wBW=wn*sqrt((1-2*z^2)+sqrt(4*z^4-4*z^2+2))

Pm = atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
wpm = 0.8*wBW

[M,P] = bode(GK, wpm);
M
P

Pmown = -180-P
Pmreq = Pm+Pmown
zc = wpm/tand(Pmreq)

KPD = 1/zc
GPD=tf(KPD*[1 zc], 1)

T = feedback(GPD*GK, 1)
step(T)
%bode(GPD*GK, w)
