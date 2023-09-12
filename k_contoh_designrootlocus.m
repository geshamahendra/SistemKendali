num = 1; den = poly ([0 -7]);
G = tf(num, den); %unity feedback = 1
H = 1; GH = G*H; 
pos = 15;
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(G)
sgrid(z,0)
%[K,p] = rlocfind(G)

%{
evaluasi steady state input untuk ramp error
s = tf('s'); atau s = tf([1, 0], 1);
Kv = dcgain(K*G*s)
ess = 1/Kv

menggunakan lag compensator
pc = 0.01
zc = 20*pc
Gc = tf([1 zc], [1 pc])

menentukan gain K
Gt = Gc*G
rlocus(Gt)
sgrid(Z, 0)
[K,p] = rlocfind(G)

verifikasi error yang telah dicapai
Kv = dcgain(K*Gt*s)
essn = 1/Kv

mencari perbandingan
Imp = ess/essn
}%