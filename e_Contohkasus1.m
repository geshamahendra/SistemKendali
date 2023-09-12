numg=25;
deng=poly(0 -5);
%atau deng=conv([1 0],[1 5]);
G=tf(numg,deng)
T=feedback(G,1)
[numt, dent]=tfdata(T,'v')
%a=dent[1]
wn=sqrt(dent(3))
z=dent(2)/(2*wn)
Ts=4/(z*wn)
Tp=pi/(wn*sqrt(1-z^2))
pos=exp(-z*pi/sqrt(1-z^2))*100

%z=-log(pos/100)/sqrt(pi^2+[log(pos/100)]^2
