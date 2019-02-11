function show = nprs_rx(grid,index)
%fn that takes the index of nprs and extract them out from the grid
h = length(index);
m = zeros(h,1);
    for i=1:(h)
    x = index(i,:);
    m(i) = grid((x(1)),(x(2)));
    end
show = m;
end
        

















