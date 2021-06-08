clear; close all;warning off;
delete(instrfind);
%% Parameter
P=101.3; % pa
T=300; % K
Tmonit=3600*18; % sec
Arduino_com='COM3';

%% Initialize
Qsh_monit=27;%27;
Dp_monit=150; % unit nm up DMA diameter setting
MonitDMA_dim=DMA_parameter(0); %0: HDDMA; 1: LDMA
vset_monit=VfromDp(Dp_monit,Qsh_monit,MonitDMA_dim,P,T)./MonitDMA_dim.scaling_HV;

%% set up serial
WT=serial(Arduino_com);
serial_setting(WT);


for n=1    
    fopen(WT);fscanf(WT);
    
    pause(1);
    flushinput(WT);    
    Data_Mx=zeros(1,1);
    tic;
    T1=0;
    i=1;
    while T1<Tmonit
        Data0=str2num(fscanf(WT));        
        T1=toc;
        Time(i)=T1;
        Data_Mx=[Data_Mx;Data0];
        i=i+1;
    end
    Time=Time(1:end);
    Data_Mx=Data_Mx(2:end);
    plot(Time,Data_Mx);
    filename='current_monitoring';
    save(filename,'Time','Data_Mx');
    clear filename;
    fclose(WT);          
end
delete(instrfind);
