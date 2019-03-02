% load('sim_data.mat');
load('matlab.mat');
x = input_data.data;
N = length(x);
nfft = 2^nextpow2(N)

y = output_data.data(1:N);

fs = 1000;
t = (1 : N) / fs;

f = (1 : N) / N * fs;
figure(1);
title('raw input and ouput data')
subplot(2, 1, 1);
plot(f, x);
subplot(2, 1, 2);
plot(f, y);

figure(2);
fn = (1 : nfft) / N * fs;
fftx = windowing_fft(x);
title('fft analysis of input data')
subplot(2, 1, 1);
plot(fn, abs(fftx));
subplot(2, 1, 2);
plot(fn, angle(fftx));


h = windowing_fft(y) ./ windowing_fft(x);
mag = abs(h);
phase = angle(h);
figure(3);
title('system iden result')
subplot(2, 1,1);
plot(20 * log(fn), mag);
subplot(2, 1, 2);
plot(20 * log(fn), phase);

figure(4);
title('ideal bode plot');
H = tf([1],[1, 0.5, 1]);
bode(H);

