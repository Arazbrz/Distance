function [fault,i1,i2,i3,i4]=FoursquareCheck3(rtest1,xtest1,z1,k)
% a=25/((imag(z1)/real(z1))+tand(15));
% JR(1,:)=linspace(0,a,1000);
% JR(2,:)=linspace(0,-a*tand(15),1000);
% KR(1,:)=linspace(-k*imag(z1)*tand(15),25+real(z1),1000);
% KR(2,:)=linspace(k*imag(z1),k*imag(z1),1000);
% JX(1,:)=linspace(0,k*imag(z1),1000);
% JX(2,:)=linspace(0,-k*imag(z1)*tand(15),1000);
% KX(1,:)=linspace(-a*tand(15),k*imag(z1),1000);
% KX(2,:)=linspace(a,25+real(z1),1000);
a=63;
b=-10;
JR(1,:)=linspace(0,a,1000);
JR(2,:)=linspace(0,b,1000);
KR(1,:)=linspace(-2.1*(imag(z1)*tand(80)),79.76,1000);
KR(2,:)=linspace(2.1*imag(z1),2.1*imag(z1),1000);
JX(1,:)=linspace(0,2.1*imag(z1),1000);
JX(2,:)=linspace(0,-2.1*(imag(z1)*tand(80)),1000);
KX(1,:)=linspace(b,2.1*imag(z1),1000);
KX(2,:)=linspace(a,79.76,1000);
%locating of rtest1
for i1=1:1000
    if(rtest1>JR(1,i1))
        rtest1J=JR(1,i1);
    else
    break
    end
end
for i2=1:1000
    if(rtest1>JR(1,i2))
        rtest1K=KR(1,i2);
    else
    break
    end
end
%locating of xtest1
for i3=1:1000
    if(xtest1>JR(1,i3))
        xtest1J=JR(1,i3);
    else
    break
    end
end
for i4=1:1000
    if(xtest1>KR(1,i4))
        xtest1K=KR(1,i4);
    else
    break
    end
end

if xtest1(1) > JR(2,i1) && xtest1(1) < KR(2,i2) && rtest1(1) > JX(2,i3) && rtest1(1) < KX(2,i4)
    fault=1; 
else
    fault=0;
end

    
end