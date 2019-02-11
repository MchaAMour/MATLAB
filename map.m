function [show, index] = map(grid,nprs,cellID,Subframes)
% mapping NPRS signal to downlink subframe
je = 1; % counter for array of nprs indexes 
h = length(Subframes);
index = zeros(h*28,2) ;
    for  i = 1:h
            t = 1; % counter for the nprs 28 re's
            sub = Subframes(:,i);
            n = 14 * sub ;
            s = n - 13;
            for slot = 1:2
                 if slot == 1
                            a = s  ; % 1st 7 symbols 
                 else 
                             a = s + 7 ;
                 end 
                    for m = 0:1      
                        for l = 0:6
                            shift = mod(cellID,6) ;
                            k = (6 * m) + (mod((6 - l + shift),6));
                            if t > 28
                                break
                            end
                            col = 12 - (k);
                            row = a + l ;
                            index(je,:) = [col row];
                            grid(col,row) = nprs(t,sub) ;
                            je = je +1;
                            
                            %WAW = [row col]
                            t = t+1; 

                        end
                    end
            end 
    end 
    
    show = grid;
end
  

% free subframes for positioning in 20 subframes total
%%Sub = [2 3 4 7 8 9 12 13 14 15 17 18 19 20 ]

%free subframes for positioning in 180 subframes total
%Sub = [2 3 4 7 8 9 12 13 14 15 17 18 19 20 22 23 24 27 28 29 32 33 34 35
%37 38 39 40 42 43 44 47 48 49 52 53 54 55 57 58 59 60 62 63 64 67 68 69 72
%73 74 75 77 78 79 80 82 83 84 87 88 89 92 93 94 95 97 98 99 100 102 103
%104 107 108 109 112 113 114 115 117 118 119 120 122 123 124 127 128 129
%132 133 134 135 137 138 139 140 142 143 144 147 148 149 152 153 154 155
%157 158 159 160 162 163 164 167 168 169 172 173 174 175 177 178 179 180]

                  
                    
                    
            