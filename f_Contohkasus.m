%slide pdf stability

numg=500*poly([-2 -5 -6]);
deng=poly([0 -8 -10 12]);
G=tf(numg,deng)
T=feedback(G,1)
poles=pole(T)

%bentuk step
Kp=dcgain(G)
ess=1/(1+Kp)
step(T)
hold on

%bentuk ramp
densg=deng;
numsg=convconv([1 0],numg);
