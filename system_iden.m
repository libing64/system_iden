% load('sim_data.mat');
load('matlab.mat');
x = input_data.data;
N = length(x);
nfft = 2^nextpow2(N);

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


N2 = N/2;
valid_index = 1 : N2;
figure(2);
fn = (1 : N2) / N * fs;
fftx = windowing_fft(x);
mag = abs(fftx(valid_index));
phase = angle(fftx(valid_index)) * 180 / pi;
title('fft analysis of input data')
subplot(2, 1, 1);
plot(fn, mag);
subplot(2, 1, 2);
plot(fn, phase);


h = windowing_fft(y) ./ windowing_fft(x);
mag = abs(h(valid_index));
phase = angle(h(valid_index)) * 180 / pi;
figure(3);

subplot(2, 1,1);
title('system iden mag response')
loglog(fn(valid_index), mag);

subplot(2, 1, 2);
title('system iden phase response')
semilogx(fn, phase);

figure(4);
title('ideal bode plot');
H = tf([1],[1, 0.2, 1]);
bode(H);

