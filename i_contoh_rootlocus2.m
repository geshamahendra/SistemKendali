num= poly([2 4]);
den= [1 6 25];
GH= tf(num, den)
rlocus(GH)
sgrid(0.5,0)
