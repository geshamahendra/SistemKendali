%Slide Contoh pada slide Time-Responce Performance paling akhir
syms s t
G= 20.83/(s*(s+100)*(s+1.71));
T= ilaplace(G)

%plotting
t=0:0.1:10;
C=(2083*exp(-100*t))/982900 - (208300*exp(-(171*t)/100))/1680759 + 2083/17100;
plot(t,C)