clear; close all;warning off;
delete(instrfind);
%% Parameter
P=101.3; % pa
T=300; % K
Tmonit=15; % sec
Arduino_com='COM3';
cpc1_com='com4'; % upstream CPC
cpc2_com='com2'; % downstream CPC

%% Initialize
Qsh_monit=5;%27;
Dp_monit=15; % unit nm up DMA diameter setting
MonitDMA_dim=DMA_parameter(0); %0: HDDMA; 1: LDMA
vset_monit=VfromDp(Dp_monit,Qsh_monit,MonitDMA_dim,P,T)./MonitDMA_dim.scaling_HV;

%% set up serial
WT=serial(Arduino_com);
serial_setting(WT);
% WT_cpc1=serial(cpc1_com);
% serial_setting(WT_cpc1);
% WT_cpc2=serial(cpc2_com);
% serial_setting(WT_cpc2);

for n=1    
    fopen(WT);fscanf(WT);
%     % upstream CPC
%     fopen(WT_cpc1);
    cmd1=strcat('s,',num2str(vset_monit),',',num2str(MonitDMA_dim.scaling_HV))    
    fprintf(WT,'%s',cmd1);
%     fprintf(WT_cpc1,'SM,2,10');
%     fclose(WT_cpc1);
%     % downstream CPC
%     fopen(WT_cpc2);    
%     fprintf(WT_cpc2,'SM,2,10');
%     fclose(WT_cpc2);
    pause(1);
    flushinput(WT);    
    Data_Mx=zeros(1,3);
%     fopen(WT_cpc1);
%     fopen(WT_cpc2);
    tic;
    T1=0;
    i=1;
    while T1<Tmonit
        Data0=str2num(fscanf(WT));        
%         Data1=strsplit(fscanf(WT_cpc1),',');
%         Data2=strsplit(fscanf(WT_cpc2),',');
        T1=toc;
        Time(i)=T1;
%         N_cpc1(i)=str2num(char(Data1(4)));
%         N_cpc2(i)=str2num(char(Data2(4)));
        Data_Mx=[Data_Mx;Data0];
        i=i+1;
    end
    filename=['V2000_Dp' num2str(Dp_monit)];
    save(filename,'Time','Data_Mx'); %,'N_cpc1','N_cpc2'
    clear filename;
    fclose(WT);
%     fclose(WT_cpc1);  
%     fclose(WT_cpc2);
end
delete(instrfind);
