clear; clf; clc;
pos=10; Tp=0.1; Kv=30;      				
numg=[1 1];				
deng=poly([0 -2 -6]);            
G=tf(numg,deng);
s=tf([1 0],1);                      
sG=s*G;                         
sG=minreal(sG);                   
K=dcgain(Kv/sG);      

'G(s)'					
G=zpk(K*G)
z=(-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
Pm=atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi); 
wn=pi/(Tp*sqrt(1-z^2));             
wBW=wn*sqrt((1-2*z^2)+sqrt(4*z^4-4*z^2+2));
w=0.01:0.5:1000;
[M,P]=bode(G,w);
[Gm,Pm,Wcg,Wcp]=margin(G);
Pmreq=atan(2*z/(sqrt(-2*z^2+sqrt(1+4*z^4))))*(180/pi);
Pmreqc=Pmreq+10; %offset
Pc=Pmreqc-Pm;

%lead compensator
beta=(1-sin(Pc*pi/180))/(1+sin(Pc*pi/180));
magpc=1/sqrt(beta);
k=1:1:length(M);
k=find(M(k)<=(1/magpc),1)            
wmax=w(k); 
zc=wmax*sqrt(beta);
pc=zc/beta;
Kc=1/beta;
Gc=tf(Kc*[1 zc],[1 pc]);
Gc=zpk(Gc)
Ge=G*Gc                         
sGe=s*Ge;
sGe=minreal(sGe);
Kv=dcgain(sGe)

T0=feedback(G,1); %sudah K*G
T=feedback(Ge,1);

step(T0)
hold on
step(T)
