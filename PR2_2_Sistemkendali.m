num = 1; den = poly([-1 -3 -10]);
H=1;
G=tf(num, den)
GH=G*H;
GH=G;
rlocus(GH)
z = 0.4;
sgrid(z, 0)

%{
[K,p]=rlocfind(G)
Ts = 4/abs(real(p(2)))
Tp = pi/abs(imag(p(2)))
Kp = K/30
%}

%{
%compensator -0.1
numgc_1 = [1 0.1]; dengc_1 = [1 0];
Gc_1 = tf(numgc_1, dengc_1);
Gt_1 = Gc_1*G;
rlocus(Gt_1)
sgrid(z, 0)

[K1,p1] = rlocfind(Gt_1)
Ts_1 = 4/abs(real(p1(2)))
Tp_1 = pi/abs(imag(p1(2)))
Kp_1 = K/30

s = tf('s')
Kv_1 = dcgain(K1*s*Gt_1)
ess_1 = 1/Kv_1
%}

%{
%compensator -0.7
numgc_2 = [1 0.7]; dengc_2 = [1 0];
Gc_2 = tf(numgc_2, dengc_2);
Gt_2 = Gc_2*G;
rlocus(Gt_2)
sgrid(z, 0)

[K2,p2] = rlocfind(Gt_2)
Ts_7 = 4/abs(real(p1(2)))
Tp_7 = pi/abs(imag(p1(2)))
Kp_7 = K/30

s = tf('s')
Kv_7 = dcgain(K1*s*Gt_2)
ess_7 = 1/Kv_7
%}

%{
T=feedback(K*G,1)
step(T)
hold on

T1=feedback(K1*Gt_1,1)
step(T1)
hold on

T2=feedback(K2*Gt_2,1)
step(T2)

legend({'uncompensated','compensated with 0.1','compensated with 0.7'},'Location','southeast')
%}
