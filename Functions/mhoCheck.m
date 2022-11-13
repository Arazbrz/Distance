function y=mhoCheck(rtest1,xtest1,z1,k)
if abs(rtest1+1i*xtest1)<k*abs(z1) && (rtest1>0 || xtest1>0)
    y=1;
else
    y=0;
end
end