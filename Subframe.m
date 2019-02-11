function show = Subframe(grid,N)
% fn shows only specific subframe inside grid
n = 14 * N;
s = n - 13;
show = grid(:,s:n);
end
        