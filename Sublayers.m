function show = Sublayers(grid,N)
% converts 2D grid into 3D grid (subcarriers,symbols,layers(subframe))
mat = zeros(12,14,N) ;
for i=1:N
    n = 14 * N;
    s = n - 13;
    mat(:,:,i) = grid(:,s:n);
end
show = mat;

end
        