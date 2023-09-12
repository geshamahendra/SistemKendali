num= 1;
den= poly([-1 -2 -3]);
GH= tf(num, den)
pos= 20
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(GH)
sgrid(z,0)
%[K,p] = rlocfind(GH)
%Ts = 4/abs(real(p(2)))
%Tp = pi/imag((p(2)) 
%T = feedback(K*GH,1)
%step(T)
