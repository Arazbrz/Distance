function CA=Foursquaretrip(rtest,xtest,z1,k)
CA=0;
CAf=0;
for i=1:length(rtest)
faultCA(i)=FoursquareCheck(rtest(i),xtest(i),z1,k);
if CAf<20
    CAf=faultCA(i)+CAf;
else
    CA=1;
    break
end
end