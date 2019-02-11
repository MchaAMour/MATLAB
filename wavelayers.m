function show = wavelayers(wave,N)
% converts 1D waveform to waveform per Subframe 2D (waveform,subFr(each
% colomn is subframe)
mat = zeros(1920,N) ;
for i=1:N
    n = 1920 * N;
    s = n - 1919;
    mat(:,i) = wave(s:n);
end
show = mat;

end
        