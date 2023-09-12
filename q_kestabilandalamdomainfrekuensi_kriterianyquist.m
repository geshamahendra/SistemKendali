%Kriteria nyquist
K = 1; %K = 2; K = 3; 
num = K; den = poly([0 -1 -1]); %(-1^2)
G = tf(num, den)
nyquist(G)
axis([-2 1 -1.5 1.5]) %xmin xmax ymin ymax 