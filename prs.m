%hNRS Narrowband reference signal
%   SYM = hNRS(...) returns a complex column vector containing narrowband
%   reference signal symbols. Note that unlike other physical channels and
%   signals, the symbols for multiple antennas are concatenated into a
%   single column rather than returned in a matrix with a column for each
%   antenna. This is because the number of symbols varies across the
%   antenna ports.
%
%   SYM = hNRS(ENB) returns narrowband reference signal symbols for cell
%   wide settings in structure ENB:
%   NNCellID     - Narrowband physical layer cell identity
%   CellRefP     - Number of narrowband reference signal antenna ports
%                  (1,2)
%   NSubframe    - Subframe number (0,1,...,9)
%
%   SYM = hNRS(ENB,PORTS) returns narrowband reference signal symbols for
%   the antenna ports specified in the vector PORTS (0,1) and cell wide
%   settings structure ENB defined above. In this case, CellRefP is ignored
%   if present in ENB and PORTS is used instead. PORTS 0 and 1 stand for
%   NRS antenna ports 2000 and 2001, respectively.
% 
%   Example:
%   % The example shows different numbers of narrowband reference signal
%   % symbols transmitted at NRS antenna ports 2000 and 2001.
%   
%   enb.NNCellID = 10;
%   enb.CellRefP = 2;
%   enb.NSubframe  = 2;
%   NRSPort2000 = length(hNRS(enb,0))        % Antenna port 2000
%   
%   % NRSPort2000 =
%   %
%   %    8
%
%   allNRSPorts = length(hNRS(enb))          % Antenna ports 2000 and 2001
%  
%   % allNRSPorts =
%   %
%   %    16
%
%   See also lteNRSIndices
% [waveform,grid,ofdmInfo] = m.generateWaveform;
%   Copyright 2017 The MathWorks, Inc.

function sym = hNRS(enb,ports)
    
        if nargin == 1
            if enb.CellRefP == 1
                ports = 0;
            else
                ports = [0 1];
            end
        end

        % Verify number of antenna ports
        if enb.CellRefP < 1 || enb.CellRefP > 2
            error('The number of antenna ports (CellRefP) must be either 1 or 2.');
        end
        enb.CellRefP = round(enb.CellRefP);

        NDLsymb = 7;
        Ncp = 1;
        nprb = 1;

        % Verify antenna ports
        if ~isnumeric(ports)
            error('Ports must be numeric.');
        end
        ports = round(ports);
        for n=1:length(ports)
            if ~(ports(n)>=0 && ports(n)<=(enb.CellRefP-1))
                error(['Ports should be within [0, ' int2str(enb.CellRefP-1) '].']);
            end
        end

        NmaxDLRB = 110; %N^{max, DL}_RB
        mvec = 0:2*nprb-1;
        sym = [];
        r = zeros(2*NmaxDLRB,1);
        NSubframe = mod(enb.NSubframe,10); % 0-9
        for ns = 2*NSubframe:2*NSubframe+1 % slot number 0-19
            for l = [NDLsymb-2 NDLsymb-1] % OFDM symbol number within the slot
                cinit = 2^28*(enb.NNCellID/512)+2^10*(7*(ns+1)+l+1)*(2*(mod(enb.NNCellID,512))+1)+2* (mod(enb.NNCellID,512))+Ncp;
                c = ltePRBS(cinit,2*NmaxDLRB+2);
                for m = NmaxDLRB-1:NmaxDLRB
                    r(m+1) = (1-2*c(2*m+1)+1i*(1-2*c(2*m+2)))/sqrt(2);
                end
                sym = [sym; r(mod(mvec,2)+NmaxDLRB)]; %#ok<AGROW>
            end
        end

        if length(ports) == 2
            sym = repmat(sym,[2 1]);
        end
    
end