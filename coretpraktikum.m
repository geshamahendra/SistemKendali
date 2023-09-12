tau = 31.586;
theta = 2.2713;
k = 0.998452;

Kp_stat = 16.71375
Ti_stat = 75923.9
Td_stat = 67.94703

Gp = tf([theta*k k],[tau 1])
Gc = tf([Kp*Ti_stat*Td_stat Kp*Ti_stat Kp], [Ti_stat])

ft_kp = tf(1+Gc*Gp)

%% variasi Kp
clear; clc;
k = 0.988; theta = 4160; Ti = 27959; Td = 1599; Kp = 7.69; tau = 25680;

s_Kp = [];
for Kp = 1:10000
    Gp = tf([-theta*k k],[tau 1]);
    Gc = tf([Kp*Ti*Td Kp*Ti Kp], [Ti]);
    fk_kp = tf(1+Gc*Gp)
    [num, den] = tfdata(fk_kp, 'v');
    
    si = roots(num);
    si = permute(si, [2 1]);
    si = real(si);
    s_Kp = [s_Kp; si];
    
end

%% variasi Ti

tau = 31.586;
theta = 2.2713;
k = 0.998452;

Kp_stat = 16.71375
Ti_stat = 75923.9
Td_stat = 67.94703

s_Ti = []
for i = 1:100
    Gp = tf([theta*k k],[tau 1]);
    Gc = tf([Kp_stat*Ti*Td_stat Kp_stat*Ti Kp_stat], [Ti]);
    fk_ti = tf(1+Gc*Gp);
    [num, den] = tfdata(fk_ti, 'v');
    
    si = roots(num);
    si = permute(si, [2 1]);
    s_Ti = [s_Ti; si];
end

%% variasi Td

tau = 31.586;
theta = 2.2713;
k = 0.998452;

Kp_stat = 16.71375
Ti_stat = 75923.9
Td_stat = 67.94703

s_Td = []
for i = 1:100
    Gp = tf([theta*k k],[tau 1]);
    Gc = tf([Kp_stat*Ti_stat*Td Kp_stat*Ti_stat Kp_stat], [Ti_stat]);
    fk_td = tf(1+Gc*Gp);
    [num, den] = tfdata(fk_td, 'v');
    
    si = roots(num);
    si = permute(si, [2 1]);
    s_Td = [s_Td; si];
end