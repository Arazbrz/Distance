clc
close all
clear  
%yinitial=(pscad)';
step=5e-5;
t=0:step:2+step;
yinitial2=spline(yinitial(1,:),yinitial(2,:),t);
yinitial2=10*sin(2*pi*60*t)+exp(-10*(t-1));
fs =20000;
f_cut=105;
[b,a]=butter(4,f_cut/(fs/2));
% freqs(b,a)
% title('frequency response of the Butterworth filter')
Y=filter(b,a,yinitial2(1,:));
[Yp1,t1]=mann_morrison(t,yinitial2,60,60,12,2+step);
[Yp2,t2]=mann_morrison(t,Y,60,60,12,2+step);
% figure
% subplot(3,1,1)
% plot(yinitial(1,:),yinitial(2,:))
% title('fault current (PSCAD simulation)')
% grid on
% xlim([.9 1.6])
% subplot(3,1,2)
% plot(t,yinitial2)
% title('resampled fault current')
% grid on
% xlim([.9 1.6])
% subplot(3,1,3)  
% plot(t,Y)
% title('filtered fault current')
% grid on  
% xlim([.9 1.6])
figure
subplot(2,1,1)
plot(t,yinitial2)
title('resampled fault current')
hold on
plot(t1,Yp1)
legend('filtered fault current','estimated amplitude')
xlim([.9 1.3])
ylabel('current(kA)')
xlabel('time(s)')
subplot(2,1,2)
plot(t,Y)
title('filtered fault current')
hold on
plot(t2,Yp2)
legend('filtered fault current','estimated amplitude')
grid on
xlim([.9 1.3])
ylabel('current(kA)')
xlabel('time(s)')

