syms s t 
C=(0.4/s)+(0.6/(s+5));
ilaplace(C)

%%melihat respon t
t=0:0.1:10;
ct=2/5+(3/5*exp(-5*t));
plot(t,ct)

%%langsung melihat grafik dari fungsi laplace
num=[1 2];
den=[1 5];
G=tf(num, den)
step(G)
