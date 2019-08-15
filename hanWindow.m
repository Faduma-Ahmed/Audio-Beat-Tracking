function result=hanWindow(signal, bandlimits, Fs)

Total=0;
nSignal = length(signal);
nBands = length(bandlimits);
windowLen= 0.4;

% create half-hanning window
 hanLen = windowLen*2*Fs;
 disp(hanLen);
 han = [zeros(nSignal,1)];
 
 for a = 1:hanLen
    han(a) = (cos(a*pi/hanLen/2)).^2;
 end
   
  % Convolving with half-Hanning same as multiplying in
  % frequency. Multiply half-Hanning FFT by signal FFT. Inverse
  % transform to get output in the time domain.

  for i = 1:nBands
    filtered(:,i) = fft(signal(i,:)).*fft((han'));
    output(:,i) = real(ifft(filtered(:,i)));
  end

Total = sum(output');
 %convert time domaim
N=length(Total');
t = linspace(0, N/Fs, N);

% %Graph
figure('Name','After Windowing');
plot(t, Total','--');
title('Signal (Time Domain)')
xlabel('Time(s)')
ylabel('Relative Signal Magnitude')


 
