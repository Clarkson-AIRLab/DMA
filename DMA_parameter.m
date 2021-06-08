function DMA_dim = DMA_parameter( dma_type )
switch dma_type
    case 0  % HDDMA
        R1=0.1;
        R2=0.1102;
        L=0.225; % down length; uplength is 0.05 m
        scaling_HV=2000;
    case 1 % LDMA
        R1=9.37e-3;
        R2=1.958e-2;
        L=4.444e-1;
        scaling_HV=2000;
    case 2 % nanoDMA
        R1=9.385e-2;
        R2=19.095e-2;
        L=5e-2;
        scaling_HV=2000;
end
DMA_dim.R1=R1;
DMA_dim.R2=R2;
DMA_dim.L=L;
DMA_dim.scaling_HV=scaling_HV;
end

