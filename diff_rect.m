function stuff=diff_rect(signal)

%the function takes in a signal in the time-domain, finds the 1st
%derivative and rectifies the result
Fs = 4096;

nBands=6;
nSignal = length(signal);


output=diff(signal,1);

output(output<0)=0;

Total = sum(output');

 %Plotting 
N=length(Total');
t = linspace(0, N/Fs, N);

%Graph
figure('Name','After Windowing');
plot(t, Total','--');
title('Signal (Time Domain)');
xlabel('Time(s)');
ylabel('Rectified Envelope Difference');

