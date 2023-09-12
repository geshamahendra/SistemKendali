num= 1;
den= poly([-2 -4 -6]);
GH= tf(num, den)
pos=10
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(GH)
sgrid(z,0)
[K,p]=rlocfind(GH)

%Ts=4/2.0390
%T=feedback(K*GH,1)
%step(T)
