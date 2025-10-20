% hold on
s = tf('s');
mas_1 = -masuratoare_1.Data(2:end) + ones(849,1)*213;
mas_2 = -masuratoare_2.Data(2:end) + ones(811,1)*212;
mas_3 = -masuratoare_3.Data(2:end) + ones(811,1)*212;
%plot(masuratoare_1.Time(2:end), mas_1)
%plot(masuratoare_2.Time(2:end), mas_2)
%plot(masuratoare_3.Time(2:end), mas_3)
Ws = 15;
a = 1;
b = ones(1, Ws) * 1/Ws;
filter_1 = filter (b, a, mas_1);
filter_2 = filter (b, a, mas_2);
filter_3 = filter (b, a, mas_3);

% figure;
% hold on
% plot(masuratoare_1.Time(2:end), mas_1)
% plot(masuratoare_1.Time(2:end), filter_1)
% 
% figure;
% hold on
% plot(masuratoare_2.Time(2:end), mas_2)
% plot(masuratoare_2.Time(2:end), filter_2)
% 
% figure;
% hold on
% plot(masuratoare_3.Time(2:end), mas_3)
% plot(masuratoare_3.Time(2:end), filter_3)

mas = (filter_1(1:811) + filter_2 + filter_3)./3;
plot(masuratoare_1.Time(2:812), mas)
Vs = 38.3333;
R = 85;
tt = 170.75;

Kp = Vs/R;
Tp = tt/3.9;
Hp = Kp / (Tp*s +1);

step (Hp)

%%
ttr = 130;
K0 = 1;
T0 = 130/3;
H0 = K0/(T0 * s + 1);
Hd = K0 / (T0 * s);
Hr = Hd / Hp;
opt = c2dOptions('Method','tustin');
Hr_d = c2d(Hr,1,opt);
