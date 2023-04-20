%% Question 5
% sampling
%% a
% look at dnsample.m in same folder

%% b
Fs = 1;
Ts = 1/Fs;
t = -50:Ts:50;
x = cos(0.16 * pi * t);
M = 4;
Fds = Fs/M;
y = dnsample(x, M);

figure;
hold on
plot(t, x);
plot(t(1:M:end), y, ':.');
title('Original Signal vs Sampled Signal');
legend('Original signal', 'Sampled signal')
%% c
x2 = cos(0.8 * pi * t);
y2 = dnsample(x2, M);

figure;
hold on
subplot(2,1,1)
plot(t, x2);
ylabel('signal')
title('Original Singal');
subplot(2,1,2)
plot(t(1:M:end), y2)
title('Sampled Signal')
xlabel('time')
ylabel('signal')

% the downsampled signal loses significant information about the signal
%% d
x_hat = fft(x);
x2_hat = fft(x2);
N = length(x_hat);
freq = (Fs * (0:N-1))/N;


y_hat = fft(y);
y2_hat = fft(y2);
N2 = length(y_hat);
freq2 = (Fds * (0:N2-1))/N2;
    
figure
subplot(2,2,1)
plot(freq(1:floor(N/2)), 2*abs(x_hat(1:floor(N/2))/N))
title('fft(cos(0.16*\pi*n))')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

subplot(2,2,2)
plot(freq(1:floor(N/2)), 2*(abs(x2_hat(1:floor(N/2))/N)))
title('fft(cos(0.8*\pi*n))')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

subplot(2,2,3)
plot(freq2(1:floor(N2/2)), 2*abs(y_hat(1:floor(N2/2))/N2))
title('Downsampled fft(cos(0.16*\pi*n))')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

subplot(2,2,4)
plot(freq2(1:floor(N2/2)), 2*abs(y2_hat(1:floor(N2/2))/N2))
title('Downsampled fft(cos(0.8*\pi*n))')
xlabel('Frequency (Hz)')
ylabel('Amplitude')

% The maximum frequency for which the original signal can be recovered is half 
% the downsampling rate, for example, pi/2 radians/sample (in normalized frequency) 
% or Fs/4 in Hz, where Fs is the sampling frequency.
