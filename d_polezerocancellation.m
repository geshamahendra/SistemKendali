%%Contoh pada slide Time-Responce Performance
num1 = 26.25*[1 4];
num2 = num1;
den1 = poly([0 -3.5 -5 -6]); %%pengganti conv dengan menggunakan akar
C1 = tf(num1, den1)
pole(C1)
step(C1)