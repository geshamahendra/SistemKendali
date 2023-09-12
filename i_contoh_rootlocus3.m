num= [1 1.5]
den= poly([0 -1 -10])
GH=tf(num, den)
pos=1.52;
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(GH)
sgrid(z,0)

%[K,p]=rlocfind(GH)
%[K2,p2]=rlocfind(GH)
%[K3,p3]=rlocfind(GH)

T=feedback(K*GH,1)
step(T)
hold on
T2=feedback(K2*GH,1)
step(T2)
T3=feedback(K3*GH,1)
step(T3)

Ts1=4/real(p2)

