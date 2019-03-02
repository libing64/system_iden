function fftx = windowing_fft(x)
    N = length(x);
    nfft = 2^nextpow2(N)
    win = hamming(N);
    fftx = fft(win.*x, nfft);

end