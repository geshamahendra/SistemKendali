num=9
den=[1 9 9]
%%cara 1
roots(den)
%%cara 2
G=tf(num,den)
pole(G)

%%Melihat respon
step(G)

%%karakteristik overdamped kedua akar bernilai negatif