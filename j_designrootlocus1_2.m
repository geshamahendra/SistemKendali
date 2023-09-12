numg= 1; deng= poly([0 -7]);
G=tf(numg, deng)
pos= 15;
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(G) %unity feedback
sgrid(z,0)
%[K,p]= rlocfind(G)
%{
K =

   45.7063


p =

  -3.5000 + 5.7841i
  -3.5000 - 5.7841i
%}

%s= tf('s')
%Kv= dcgain(K*G*s)
%ess=1/(1+Kp)

%Compensation
