%% Master script for Transmission
clear ;
clc;

a = NBIoTDownlinkWaveformGenerator;
a.Config.NPDCCH.Enable = 'Off'; % Disable the NPDCCH
a.Config.NPDSCH.Enable = 'Off'; % Disable the NPDSCH
a.Config.NNCellID = 0;
a.Config.TotSubframes = 100;
[waveform_a,grid_a,ofdmInfo_a] = a.generateWaveform;
a.Config.NPRS = Pframe(a,100);
Sub = [2 3 4 7 8 9 12 13 14 15 17 18 19 20 22 23 24  27 28 29 32 33 34 35 37 38 39 40 42 43 44 47 48 49 52 53 54 55 57 58 59 60 62 63 64 67 68 69 72 73 74 75 77 78 79 80 82 83 84 87 88 89 92 93 94 95 97 98 99 100];
[grid_a,index_a] = map(grid_a,a.Config.NPRS,a.Config.NNCellID,Sub);
a.Config.grid = Sublayers(grid_a,100);
a.Config.waveform = OFDMTx(a.Config.grid);



%wavelayers(waveform_a,20)
%a.Config.SIB1NPDSCH.Enable =  'Off'; % Disable the SIB


%b = NBIoTDownlinkWaveformGenerator;
%b.Config.NPDCCH.Enable = 'Off';
%b.Config.NPDSCH.Enable = 'Off'; 
%b.Config.NNCellID = 1;
% [waveform_b,grid_b,ofdmInfo_b] = b.generateWaveform;
% b.Config.NPRS = Pframe(b,20);
% [grid_b,index_b] = map(grid_b,b.Config.NPRS,b.Config.NNCellID,Sub);
% b.Config.grid = Sublayers(grid_b,20);
% b.Config.waveform = OFDMTx(b.Config.grid) ;
% 
% 
% 
% c = NBIoTDownlinkWaveformGenerator;
% c.Config.NPDCCH.Enable = 'Off';
% c.Config.NPDSCH.Enable = 'Off';
% c.Config.NNCellID = 2;
% [waveform_c,grid_c,ofdmInfo_c] = c.generateWaveform;
% c.Config.NPRS = Pframe(c,20);
% [grid_c,index_c] = map(grid_c,c.Config.NPRS,c.Config.NNCellID,Sub);
% c.Config.grid = Sublayers(grid_c,20);
% c.Config.waveform = OFDMTx(c.Config.grid) ;
% 
% 
% %delaying the tx waveform
% a.Config.delay = delayseq(a.Config.waveform,2);
% b.Config.delay = delayseq(b.Config.waveform,2);
% c.Config.delay = delayseq(c.Config.waveform,2);
% Tx = a.Config.delay + b.Config.delay + c.Config.delay ;
% Rx = OFDMRx(Tx);
%  
