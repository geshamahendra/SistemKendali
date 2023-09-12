num=9
den=[1 2 9]
%%cara 1
roots(den)
%%cara 2
G=tf(num,den)
pole(G)

%%Melihat respon
step(G)

%%karakteristik underdamped bilangan real dan imajiner