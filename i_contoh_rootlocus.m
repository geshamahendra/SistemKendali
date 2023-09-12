num= [1 -4 20]
den= poly([-2 -4])
GH= tf(num, den)
rlocus(GH)

%plot sebuah garis lurus zeta
z= 0.45;
sgrid(z,0) %0 untuk semua omegan

%menemukan titik potong
rlocfind(GH)