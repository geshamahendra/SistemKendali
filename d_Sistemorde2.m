%%Persamaan T1
num1= 24.542;
den1= [1 4 24.542];
T1=tf(num1, den1)
pole(T1)
roots(den1)

%%Persamaan T2
num2= 245.42;
den2= conv([1 10],[1 4 24.542]);
T2= tf(num2, den2)
pole(T2)
roots(den2)

%%Persamaan T3
num3= 73.626;
den3= conv([1 3],[1 4 24.542]);
T3= tf(num3, den3)
pole(T3)
roots(den3)

%%Plot grafik
step(T1)
hold on
step(T2)
hold on
step(T3)


