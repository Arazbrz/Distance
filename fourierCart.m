function [G,F,x,a,b]=fourierCart(t,y,fn,fc,N,a)
 delta=1/(N*fn);
 x = 0:delta:a ;
 yy = spline(t,y,x);
 vpcos=zeros(1,length(x));
 vpsin=zeros(1,length(x));
 for c=(N+1):length(x)-1
     for i=0:N-1
         vpcos(c)=(2/N)*yy(c-i+1)*sin((c-i)*2*pi*fn*delta)+vpcos(c);%
         vpsin(c)=(2/N)*yy(c-i+1)*cos((c-i)*2*pi*fn*delta)+vpsin(c);%
         a(c)=sin((c-i)*2*pi*fn*delta);
         b(c)=cos((c-i)*2*pi*fn*delta);
     end
 end    
 for j = 1:length(x)
   %G(j)=sqrt(vpcos(j)^2 + vpsin(j)^2);
   %F(j)=atand(abs(vpcos(j))/abs(vpsin(j)));
   G(j)=vpsin(j);
   F(j)=vpcos(j);
 end
%  plot(x,yy,x,G,'o-')
%  grid on
%  title('domain estimation and main signal')
%  legend('main signal','estimated amplitude')
end