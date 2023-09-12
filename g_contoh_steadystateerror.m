numg= [1 5];
deng= poly([0 -6 -7 -8]);
G=tf(numg, deng)

%plotting
K=672;
GK=K*G;
T=feedback(GK,1)
s=tf('s'); %definisikan s sebagai transfer function
t=0:0.01:10; %batasi waktu selama 10 detik
%step(T/s,t)  %simulasi ramp(1/s^2) namun dipaksakan dengan fungsi
              %step(1/s)
              
%menggunakan perintah simulasi lain
lsim(T,t,t) %lsimp(T,ramp,t)
            %akan terlihat ada perbedaannya
