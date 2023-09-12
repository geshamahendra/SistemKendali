clear; clc;
k = 0.988; theta = 4160; Ti = 27959; Td = 1599; Kp = 7.69; tau = 25680;
s = tf('s')

G = 1+((Kp*Ti*s+Kp+Kp*Ti*s*Td*s)/Ti*s)*((Kp-Kp*theta*s)/Ti*s+1)
zero(G)

for Kp = 0:0.1:1
Gp = tf([theta*k k],[tau 1]);
Gc = tf([Kp*Ti*Td Kp*Ti Kp], [Ti]); 
ft = tf(Gc*Gp, (1+Gc*Gp));
fk = tf(1+Gc*Gp)
A=tf(ft).num{:};
roots(A)
end