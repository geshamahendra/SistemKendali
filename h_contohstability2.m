num= 7; den= poly([0 -1 -2]);
G=tf(num, den)
T=feedback(G,1)
step(T)