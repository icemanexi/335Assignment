%% Question 4
% low pass filters

%% i
t = linspace(-5, 5, 10000);

x = @(t) 10.*exp((-t.^2)/2);
n = @(t) cos(8.*2.*pi.*t) + 2.*sin(2*10.*pi.*t);
y = @(t) x(t) + n(t);

figure
hold on
plot(t, x(t))
plot(t ,y(t))
legend('x(t)', 'y(t)')

%% ii

% need to sample y and get a discrete representation of the signal

Fs = 10000; % should be way higher than needed
T = 1/Fs;
t_sample = -5:T:5;
y_sample = interp1(t, y(t), t_sample);
    
Y_sample = fft(y_sample);

N = 10*Fs + 1;

freq = (Fs * (0:N-1))/N; % the frequencies corresponding to each element of the fft

figure
plot(freq(1:floor(N/2)), (2/N)*abs(Y_sample(1:floor(N/2))))
title('Frequency domain of y')

% ideal low pass filter will remove signals with frequency greater
% than the cutoff frequency. This basically amounts to cutting the graph
% off after a certain frequency

cut_freq = 1;
cut_index = floor((cut_freq*N)/Fs) + 1;
Y_sample = (2 * [Y_sample(1:cut_index), zeros(1, length(Y_sample)-cut_index)]); % multiply by 2 since we are removing the negative frequencies

% The recovered signal 
recovered_x = (ifft(Y_sample)) - mean(y_sample); % read online you need to subtract DC component to obtain original signal, DC = mean
figure
plot(t_sample, recovered_x)
title('Recovered signal')

%{
The bandwidth is approximated by a maximum frequency of 1 Hz, and as long
as this is an accurate approximation, by the shannon-nyquist sampling
theorem the original signal can be reconstructed from a sampled noisy signal with
zero L_2 norm distance from each other. By parsevals theorem then, if we
minimize the L_2 distance between the two signals in the frequency domain,
it will also be minimized in the time domain.
%}


%% iii
% plotting the two signals on top of each other
% the two signals are indisinguishable 
figure
hold on
plot(t, x(t))
plot(t_sample, recovered_x)
legend('Original signal with no noise', 'Ideal filter')

%% iv
% buttersworth filter

% I found that an order of 3 removes all noise while also having the least
% distortion / shift in the signal

n = 3; % Order of the Butterworth filter
Wn = cut_freq / (Fs / 2); % Normalized cut-off frequency
[b, a] = butter(n, Wn);

% Apply Butterworth filter
y_filtered_butterworth = filter(b, a, y_sample);

figure
plot(t_sample, y_filtered_butterworth)
title('Buttersworth filter')

%% Comparing all methods

figure
hold on
plot(t, x(t))
plot(t_sample, y_filtered_butterworth)
plot(t_sample, recovered_x)
legend('Original signal with no noise', 'Buttersworth filter', 'Ideal filter')




