%% Distance relay (contribiution) 
clc
clear 
close
%%
addpath("Functions")
addpath("Inputs")
addpath("Outputs")
%% derivation of z1 of line
i=i1;
v=v1;
[iia,iiaF]=fourier(i(:,1),i(:,2),60,60,12,1);
[vva,vvaF]=fourier(v(:,1),v(:,2),60,60,12,1);
[iib,iibF]=fourier(i(:,1),i(:,3),60,60,12,1);
[vvb,vvbF]=fourier(v(:,1),v(:,3),60,60,12,1);
[iic,iicF]=fourier(i(:,1),i(:,4),60,60,12,1);
[vvc,vvcF]=fourier(v(:,1),v(:,4),60,60,12,1);
[xa,ya]=pol2cart(deg2rad(vvaF(718)-iiaF(718)),vva(718)/iia(718));
[xb,yb]=pol2cart(deg2rad(vvbF(718)-iibF(718)),vvb(718)/iib(718));
[xc,yc]=pol2cart(deg2rad(vvcF(718)-iicF(718)),vvc(718)/iic(718));
x1=(ya+yb+yc)/3;
r1=(xa+xb+xc)/3;
%z1=r1+1i*x1;
z1=100*(0.1588+1i*.413);
%% derivation of z0 of line
i=i0;
v=v0;
[iia,iiaF,xiia]=fourier(i(:,1),i(:,2),60,60,12,1);
[vva,vvaF,xvva]=fourier(v(:,1),v(:,2),60,60,12,1);
[iib,iibF,xiib]=fourier(i(:,1),i(:,3),60,60,12,1);
[vvb,vvbF,xvvb]=fourier(v(:,1),v(:,3),60,60,12,1);
[iic,iicF,xiic]=fourier(i(:,1),i(:,4),60,60,12,1);
[vvc,vvcF,xvvc]=fourier(v(:,1),v(:,4),60,60,12,1);
[xa,ya]=pol2cart(deg2rad(vvaF(718)-iiaF(718)),vva(718)/iia(718));
[xb,yb]=pol2cart(deg2rad(vvbF(718)-iibF(718)),vvb(718)/iib(718));
[xc,yc]=pol2cart(deg2rad(vvcF(718)-iicF(718)),vvc(718)/iic(718));
x0=(ya+yb+yc)/3;
r0=(xa+xb+xc)/3;
z0=r0+1i*x0;
%% deriviation of k 
%k=(z0-z1)/z1;
k=2.296+1i*.5372;
%% signals from ct and vt
vtest=vb8;
itest=ib8;
vitest=S2;
t=itest(:,1);ia=itest(:,2);ib=itest(:,3);ic=itest(:,4);i0=(ia+ib+ic)/3;
va=vtest(:,2);vb=vtest(:,3);vc=vtest(:,4);
%% feeding the signals to block AG
[vtestD,vtestF]=fourier(t,va,60,60,12,1);
[itestD,itestF]=fourier(t,ia+abs(k)*i0,60,60,12,1);
[rtest,xtest]=pol2cart(deg2rad(vtestF-itestF),vtestD./itestD);
AG=Foursquaretrip(rtest,xtest,z1,0.85);
AG2=Foursquaretrip(rtest,xtest,z1,1.5);
AG3=Foursquaretrip(rtest,xtest,z1,2.2);
% AG=mhotrip(rtest,xtest,z1,0.85);
% AG2=mhotrip(rtest,xtest,z1,1.5);
% AG3=mhotrip(rtest,xtest,z1,2.2);
subplot(2,3,1)
plot(rtest,xtest)
grid on
sAG=num2str(AG);
sAG2=num2str(AG2);
sAG3=num2str(AG3);
title(compose(strcat('AG','\n','zone1=',sAG,'\n','zone2=',sAG2,'\n','zone3=',sAG3)))
hold on 
zone1(z1)
zone2(z1)
zone3(z1)
% zone1mho(z1)
% zone2mho(z1)
% zone3mho(z1)
xlim([-50,100])
ylim([-10,100])
%% feeding the signals to block BG
[vtestD,vtestF]=fourier(t,vb,60,60,12,1);
[itestD,itestF]=fourier(t,ib+abs(k)*i0,60,60,12,1);
[rtest,xtest]=pol2cart(deg2rad(vtestF-itestF),vtestD./itestD);
BG=Foursquaretrip(rtest,xtest,z1,0.85);
BG2=Foursquaretrip(rtest,xtest,z1,1.5);
BG3=Foursquaretrip(rtest,xtest,z1,2.2);
% BG=mhotrip(rtest,xtest,z1,0.85);
% BG2=mhotrip(rtest,xtest,z1,1.5);
% BG3=mhotrip(rtest,xtest,z1,2.2);
subplot(2,3,2)
plot(rtest,xtest)
grid on
sBG=num2str(BG);
sBG2=num2str(BG2);
sBG3=num2str(BG3);
title(compose(strcat('BG','\n','zone1=',sBG,'\n','zone2=',sBG2,'\n','zone3=',sBG3)))
hold on 
zone1(z1)
zone2(z1)
zone3(z1)
% zone1mho(z1)
% zone2mho(z1)
% zone3mho(z1)
xlim([-50,100])
ylim([-10,100])
%% feeding the signals to block CG
[vtestD,vtestF]=fourier(t,vc,50,50,12,1);
[itestD,itestF]=fourier(t,ic+abs(k)*i0,50,50,12,1);
[rtest,xtest]=pol2cart(deg2rad(vtestF-itestF),vtestD./itestD);
CG=Foursquaretrip(rtest,xtest,z1,0.85);
CG2=Foursquaretrip(rtest,xtest,z1,1.5);
CG3=Foursquaretrip(rtest,xtest,z1,2.2);
% CG=mhotrip(rtest,xtest,z1,0.85);
% CG2=mhotrip(rtest,xtest,z1,1.5);
% CG3=mhotrip(rtest,xtest,z1,2.2);
subplot(2,3,3)
plot(rtest,xtest)
grid on
sCG=num2str(CG);
sCG2=num2str(CG2);
sCG3=num2str(CG3);
title(compose(strcat('CG','\n','zone1=',sCG,'\n','zone2=',sCG2,'\n','zone3=',sCG3)))
hold on 
zone1(z1)
zone2(z1)
zone3(z1)
% zone1mho(z1)
% zone2mho(z1)
% zone3mho(z1)
xlim([-50,100])
ylim([-10,100])
%% feeding the signals to block AB
[vtestD,vtestF]=fourier(t,va-vb,60,60,70,1);
[itestD,itestF]=fourier(t,ia-ib,60,60,70,1);
[rtest,xtest]=pol2cart(deg2rad(vtestF-itestF),vtestD./itestD);
AB=Foursquaretrip(rtest,xtest,z1,0.85);
AB2=Foursquaretrip(rtest,xtest,z1,1.5);
AB3=Foursquaretrip(rtest,xtest,z1,2.2);
% AB=mhotrip(rtest,xtest,z1,0.85);
% AB2=mhotrip(rtest,xtest,z1,1.5);
% AB3=mhotrip(rtest,xtest,z1,2.2);
subplot(2,3,4)
plot(rtest,xtest)
grid on
sAB=num2str(AB);
sAB2=num2str(AB2);
sAB3=num2str(AB3);
title(compose(strcat('AB','\n','zone1=',sAB,'\n','zone2=',sAB2,'\n','zone3=',sAB3)))
hold on 
zone1(z1)
zone2(z1)
zone3(z1)
% zone1mho(z1)
% zone2mho(z1)
% zone3mho(z1)
xlim([-50,100])
ylim([-10,100])
%% feeding the signals to block BC
[vtestD,vtestF]=fourier(t,vb-vc,50,50,12,1);
[itestD,itestF]=fourier(t,ib-ic,50,50,12,1);
[rtest,xtest]=pol2cart(deg2rad(vtestF-itestF),vtestD./itestD);
BC=Foursquaretrip(rtest,xtest,z1,.85);
BC2=Foursquaretrip(rtest,xtest,z1,1.5);
BC3=Foursquaretrip(rtest,xtest,z1,2.2);
% BC=mhotrip(rtest,xtest,z1,.85);
% BC2=mhotrip(rtest,xtest,z1,1.5);
% BC3=mhotrip(rtest,xtest,z1,2.2);
subplot(2,3,5)
plot(rtest,xtest)
grid on
sBC=num2str(BC);
sBC2=num2str(BC2);
sBC3=num2str(BC3);
title(compose(strcat('BC','\n','zone1=',sBC,'\n','zone2=',sBC2,'\n','zone3=',sBC3)))
hold on 
zone1(z1)
zone2(z1)
zone3(z1)
% zone1mho(z1)
% zone2mho(z1)
% zone3mho(z1)
xlim([-50,100])
ylim([-10,100])
%% feeding the signals to block CA
[vtestD,vtestF]=fourier(t,vc-va,50,50,12,1);
[itestD,itestF,x]=fourier(t,ic-ia,50,50,12,1);
[rtest,xtest]=pol2cart(deg2rad(vtestF-itestF),vtestD./itestD);
%[rtest2,xtest2,xyfit,xdata,ydata,u]=estimation(rtest,xtest,x,726,40);
CA=Foursquaretrip(rtest,xtest,z1,0.85);
CA2=Foursquaretrip(rtest,xtest,z1,1.5);
CA3=Foursquaretrip(rtest,xtest,z1,2.2);
% CA=mhotrip(rtest,xtest,z1,0.85);
% CA2=mhotrip(rtest,xtest,z1,1.5);
% CA3=mhotrip(rtest,xtest,z1,2.2);
subplot(2,3,6)
plot(rtest,xtest)
grid on
sCA=num2str(CA);
sCA2=num2str(CA2);
sCA3=num2str(CA3);
title(compose(strcat('CA','\n','zone1=',sCA,'\n','zone2=',sCA2,'\n','zone3=',sCA3)))
hold on 
%plot(rtest2,xtest2)
zone1(z1)
zone2(z1)
zone3(z1)
% zone1mho(z1)
% zone2mho(z1)
% zone3mho(z1)
xlim([-50,100])
ylim([-10,100])
%% fault curve estimation
% figure
% plot(xdata, ydata, '-bp')
% hold on
% plot(xyfit(:,1), xyfit(:,2), '-*m')
% hold off
% grid
% legend('real trajectory','estimation')
% figure
% plot(u)
% hold on 
% plot(rtest)