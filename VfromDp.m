% This program lets you set the diamter and the flowrates inside a DMA
% and returns a coressponding voltage
function V = VfromDp(Dp,Qsh,DMA_dim,P,T)%Dp[nm] P[kPa] T[K]
Qsh=Qsh*1e-3/60;
Qe=Qsh;
Zp_star=Dp_Zp(Dp*1e-9,1,P,T);
V = abs((Qsh+Qe)*log(DMA_dim.R2/DMA_dim.R1)./(4*pi*Zp_star*DMA_dim.L));