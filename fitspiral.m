function [xy] = fitspiral(param,t)
a=param(1);
b=param(2);
c=param(3);
d=param(4);
e=param(5);
% f=param(5);
% g=param(5);
% R=((a+(f+g).*th).^2.*(b+(f+g).*th).^2./((a+(f+g).*th).^2.*sin(th).^2+(b+(f+g).*th).^2.*cos(th).^2)).^(.5);
% x=R.*cos(th)+c;
% y=R.*sin(th)+d+(th/pi).^e;
x=a+c*exp(d*1./(t)).*cos(e*1./(t));
y=b+c*exp(d*1./(t)).*sin(e*1./(t));
% x=a+(c./t).*cos(e*t);
% y=b+(c./t).*cos(e*t);
xy=[x;y]';
end