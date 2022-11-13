function [G,x]=mann_morrison(t,y,fn,fc,N,a)
 x = 0:1/(N*fn):a;
 A=(2*pi*fc)/(N*fn*sin((2*pi*fc)/(fn*N))); %improving factor
 B=(N*fn)/(4*pi*fc); %mann-morrison deriviation factor
 yy = spline(t,y,x);
 z=size(x);
 w=size(x);
  for i=3:length(x)
      z(i)=yy(i-1);
      z(1)=0;
      z(2)=0;
     w(i)=yy(i-2);
      w(1)=0;
      w(2)=0;
  end
  n=A*B*(yy-w);
 for j = 2:length(x)
   G(j)=sqrt(n(j)^2 + yy(j-1)^2);
 end
 end