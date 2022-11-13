%% spiral
t=0:10000000;
a=1;
b=2;
c=.1;
d=20;
e=377;
x=a+c*exp(d*(1./t)).*cos(e*(1./t));
y=b+c*exp(d*(1./t)).*sin(e*(1./t));
plot(x,y,'*')