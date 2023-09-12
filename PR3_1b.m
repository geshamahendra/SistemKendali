clear; clf; clc;
num = 1; den = poly([ -1 -5 -10]);
K = 228.1243*5; %steady state error 5kali lebih bagus dari semula

G = tf(num, den)
pos = 15;
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
Pm = atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
Ph = -180+Pm+10 %offset

w = 0:0.01:1000;
[M,P] = bode(K*G, w);
k = find(P<=Ph, 1)

Mag = Mn(idx)
wf = w(k)
wh = wf/10
wl = wh/M(k)
Kc = wl/wh

'Lag compensator'
numc = [1 wh]; denc = [1 wl];
Gc = tf(Kc*numc, denc)

T0 = feedback(K/5*G, 1)
T = feedback(K*Gc*G, 1)
step(T0)
hold on
step (T)