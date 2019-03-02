function fftx = windowing_fft(x)
    N = length(x);
    win = hamming(N);
    fftx = fft(win.*x);

end