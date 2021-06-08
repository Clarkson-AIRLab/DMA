function [Zp] = Dp_Zp(Dp,n,P,T)

% Dp in m
% P in kPa
e = 1.6E-19;
Cc =1+(2./(P.*Dp*1e6*0.7502)).*(6.32+2.01*exp(-0.1095*0.7502*(P.*Dp)*1e6));

mu = 1.81e-5*(T/293.15)^(1.5)*(293.15+110.4)/(T+110.4); %change to reflect temperature dependence
Zp = (n*e*Cc)./(3*pi*mu*Dp);
