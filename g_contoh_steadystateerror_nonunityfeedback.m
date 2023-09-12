numg= 100; deng= poly([0 -10]);
numh= 1; denh= [1 5];
G=tf(numg, deng)
H=tf(numh, denh)
Ge=G/(1+G*H-G)
pole(Ge)