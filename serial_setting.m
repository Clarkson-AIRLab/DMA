function serial_setting(WT)
set(WT,'baudrate',115200);
set(WT,'Terminator','CR');
set(WT,'InputBufferSize',1000000);
set(WT,'DataBits',8);
set(WT,'StopBits',1);
set(WT,'Parity','none');
end

