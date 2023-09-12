num=3;
den=poly([0 -1 -2])
G=tf(num, den)
T=feedback(G,1)
pole(T)
step(T)