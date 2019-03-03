function fftx = windowing_fft(x)
    N = length(x);
    nfft = 2^nextpow2(N)
    win = hanning(N);
    fftx = fft(win.*x, nfft);

end