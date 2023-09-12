num= 1; den= poly([-1 -2 -10]);
H=1;
GH=G*H;
G=tf(num, den)
GH=G;
rlocus(GH)
%sgrid(0.174, 0)
%[K,p]=rlocfind(GH)

%T0=feedback(K*GH, 1)
%step(T0)
%Kp= dcgain(K*G) 
%ess= 1/(1+Kp)

%Compensator
%numc= [1 0.1]
%denc= [1 0]
%Gc=tf(numc, denc)
%Gt= G*Gc
%rlocus(Gt)
%sgrid(0.174, 0)
%[K,p]=rlocfind(Gt)
%Ts=4/3.8184
%T=feedback(K*GH,1)
%step(T)