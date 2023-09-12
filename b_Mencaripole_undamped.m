num=9
den=[1 0 9]
%%cara 1
roots(den)
%%cara 2
G=tf(num,den)
pole(G)

%%Melihat respon
step(G)

%%karakteristik undamped akarnya tidak memiliki bilangan real 
%%(marginally stable)