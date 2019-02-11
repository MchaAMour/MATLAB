function sym = trial(enb,N)

NmaxDLRB = 1; %N^{max, DL}_RB
 b.NNCellID = enb.Config.NNCellID;
 Ncp =1;
        mvec = 0:2*1-1;
        sym = [];
        r = zeros(2*NmaxDLRB,1);
        NSubframe = mod(N,10); % 0-9
        for ns = 2*NSubframe:2*NSubframe+1 % slot number 0-19
            for l = [0 1 2 3 4 5 6] % OFDM symbol number within the slot
                cinit = 2^28*(b.NNCellID/512)+2^10*(7*(ns+1)+l+1)*(2*(mod(b.NNCellID,512))+1)+2* (mod(b.NNCellID,512))+Ncp;
                c = ltePRBS(cinit,2*NmaxDLRB+2);
                for m = NmaxDLRB-1:NmaxDLRB
                    r(m+1) = (1-2*c(2*m+1)+1i*(1-2*c(2*m+2)))/sqrt(2);
                end
                sym = [sym; r(mod(mvec,2)+NmaxDLRB)]; %#ok<AGROW>
            end
        end
end
        
       %prmLTE.Nrb_sc=12;
%prmLTE.Nrb=1;
%prmLTE.N=128;
%prmLTE.Ndl_symb=7;
%prmLTE.cpLen0=10;
%prmLTE.cpLenR=9; 