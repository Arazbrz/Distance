function [rtest2,xtest2,xyfit,xdata,ydata,u]=estimation(rtest,xtest,x,c,m)
u=zeros(1,721);
for i=268 
%xdata=[399 347 292 235 167 109  76  96 197 262 323 410 463 559 566 557 527];
%ydata=[413 434 440 435 410 367 325 184 106  70  70  80 128 278 338 381 458];
xdata=rtest(i-m:i);
ydata=xtest(i-m:i);
xydata=[xdata; ydata]';
th=x(i-m:i);
const=[0 0 40  -3 20 377];
param=lsqcurvefit(@fitspiral,const,th,xydata)
[xyfit]=fitspiral(param,th);
u(i)=param(1);
end
rtest2=0;
xtest2=0;
end