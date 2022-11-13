function CA=Foursquaretrip3(rtest,xtest,z1,k)
CA=0;
CAf=0;
M=5;
power=zeros(1,length(rtest));
for i=1:length(rtest)
if rtest(i)-rtest(i-1)<M && xtest(i)-xtest(i-1)<M 
power(i)=0;
else
    power(i)=1;
end
end
for i=1:length(rtest)
faultCA(i)=FoursquareCheck3(rtest(i),xtest(i),z1,k);
if CAf<300
    CAf=faultCA(i)+CAf;
else
    if power(i)==0
    CA=1;
    end
    break
end
end