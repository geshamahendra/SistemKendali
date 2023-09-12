num= 1000; den= poly([-2 -3 -5]);
G=tf(num, den)
T=feedback(G,1)
step(T)