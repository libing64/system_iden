% load('sim_data.mat');
load('matlab.mat');
x = input_data.data;
N = length(x);
nfft = 2^nextpow2(N);

y = output_data.data(1:N);

fs = 1000;
t = (1 : N) / fs;

f = (1 : N) / N * fs;
fig1 = figure(1);
subplot(2, 1, 1);
plot(f, x);
title('raw input data')
subplot(2, 1, 2);
plot(f, y);
title('raw ouput data');
saveas(fig1, 'raw_input_output.png')


N2 = N/2;
valid_index = 1 : N2;
fig2 = figure(2);
fn = (1 : N2) / N * fs;
fftx = windowing_fft(x);
mag = abs(fftx(valid_index));
phase = angle(fftx(valid_index)) * 180 / pi;
subplot(2, 1, 1);
plot(fn, mag);
title('fft analysis of input data, mag')
subplot(2, 1, 2);
title('fft analysis of input data, phase')
plot(fn, phase);
saveas(fig2, 'fft analysis of input data.png')


h = windowing_fft(y) ./ windowing_fft(x);
mag = abs(h(valid_index));
phase = angle(h(valid_index)) * 180 / pi;
fig3 = figure(3);

subplot(2, 1,1);
loglog(fn(valid_index), mag);
title('system iden mag response')

subplot(2, 1, 2);
semilogx(fn, phase);
title('system iden phase response')
saveas(fig3, 'system identification.png')


figure(4);
H = tf([1],[1, 0.2, 1]);
bode(H);
title('ideal bode plot');


