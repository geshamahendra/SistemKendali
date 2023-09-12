clear; clf; clc; 
num = 100; den = poly([-100 -36 0]);
G = tf(num, den)
pos = 9.48;
z = -log(pos/100)/sqrt(pi^2 + [-log(pos/100)]^2)
Pm = atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi)
Ph = -180+Pm %seberapa jauh titik dari garis -180 derajat
w = 0:0.01:1000;
[M,P] = bode(G, w);
k = find(P<=Ph, 1)

M(k)
20*log10(ans) %gain ini harus dijadikan nol desibel

K = 1/M(k)
%kemudian kalikan dengan G awal
GK = K*G

%%PI Controller%%
Pmreq = Pm+10 %offset yang ditambahkan
Ph = -180+Pmreq

[M,P] = bode(GK, w);
n = find(P<=Ph, 1)

wpm = w(n)
M(n)
KPI = 1/M(n)

zc = wpm/10 %per dekade
GPI = tf(KPI*[1 zc], [1 0])

T = feedback(GK*GPI, 1)
step(T)
%bode(GK*GPI)