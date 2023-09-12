num=K*[6.63];
d1=[1 0];
d2=[1 1.71];
d3=[1 100];
den=conv(d1,conv(d2,d3));
syst=tf(num,den);
sys=feedback(syst,[1]);
%t=[0:0.05:15];
%[y,t]=step(sys,t);
%plot(t,y),grid
step(sys)
xlabel('time');
ylabel('teta');