num = [1 10]; den = poly([0 -2 -3]);
G = tf(num, den)
T = feedback(G, 1)
rlocus(G)
