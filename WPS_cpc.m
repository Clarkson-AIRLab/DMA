clear;
filename='WPS\charged_Q03_70nm_1.sms';
M=dlmread(filename,',',28,0);
conc=mean(M(:,5))./10
Scon=std(M(:,5))/10
