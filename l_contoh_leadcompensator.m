num = 1; den = poly([0 -4 -6]);
G = tf(num, den)
pos = 30;
z = (-log(pos/100))/(sqrt(pi^2+log(pos/100)^2))
rlocus(G)
sgrid(z,0)
%[K,p] = rlocfind(G)

%dpole = 2*p(2)
numgc = conv([1 5], num)
dengc = den
angle_at_dpole =(180/pi)*...
angle(polyval(numgc,dpole)/polyval(dengc,dpole))
PD_angle = 180-angle_at_dpole
zc =((imag(dpole)/tan(PD_angle*pi/180))...
-real(dpole))
pc=imag(dpole)+(real(dpole)*tand(PD_angle)))