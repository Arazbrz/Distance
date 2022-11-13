function zone3(z1)
% a=25/((imag(z1)/real(z1))+tand(15));
% x=[0 a 2.2*(25+real(z1)) -2.2*(imag(z1)*tand(15)) 0];
% y=[0 -a*tand(15) 2.2*(imag(z1)) 2.2*(imag(z1)) 0];
a=63;
b=-10;
x=[0 a 79.76 -15 0];
y=[0 b  2.1*(imag(z1)) 89 0];
plot(x,y,'g')
end