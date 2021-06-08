function Dp = Zp_Dp(Zp,n,P,T)
% % n = 1;

%Zp in m^2/V.s
e = 1.6E-19;
% P=101.325; % kPa
mu = 1.81e-5.*(T./293.15).^(1.5).*(293.15+110.4)./(T+110.4); %change to reflect temperature dependence

delta=1e-12;
dDp=1;
Cc=1;

while(abs(dDp)>delta)
    Dp=(n*e*Cc)./(3*pi*mu*Zp);
    Cc =1+(2./(P.*Dp*1e6*0.7502)).*(6.32+2.01*exp(-0.1095*0.7502*(P.*Dp)*1e6));
    Dp1=(n*e*Cc)./(3*pi*mu*Zp);
    dDp=(Dp1-Dp)./Dp1;
    Dp=Dp1;
end