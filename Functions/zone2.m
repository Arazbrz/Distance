function zone2(z1)
% a=25/((imag(z1)/real(z1))+tand(15));
% x=[0 a 1.5*(25+real(z1)) -1.5*(imag(z1)*tand(15)) 0];
% y=[0 -a*tand(15) 1.5*imag(z1) 1.5*(imag(z1)) 0];
a=42;
b=-9;
x=[0 a 53.17 -10 0];
y=[0 b 1.4*imag(z1) 58 0];
plot(x,y,'k')
end