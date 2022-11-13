function zone1(z1)
% a=25/((imag(z1)/real(z1))+tand(15));
% x=[0 a 25+real(z1) -.85*imag(z1)*tand(15) 0];
% y=[0 -a*tand(15) .85*imag(z1) .85*imag(z1) 0];
a=24;
b=-5;
x=[0 a 30.33 -8 0];
y=[0 b .8*imag(z1) 32 0];
plot(x,y,'r')
end