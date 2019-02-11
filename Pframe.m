function total = Pframe(enb,N)
% creates positioning subframes untill N highest number in subframes
    total = zeros(28,N);
for i=  1:N
        total(:,i) = NPRS(enb,i);
end
end
        
        
