function output=diffRect(signal, Fs)

%the function takes in a signal in the time-domain, finds the 1st
%derivative and rectifies the result


nBands=6;
nSignal = length(signal);


output=diff(signal,1);

output(output<0)=0;

Total = sum(output');

 %Plotting 
N=length(Total');
t = linspace(0, N/Fs, N);

%Graph
figure('Name','Differentiate, Half-Wave Rectify');
plot(t, Total','--');
title('Signal (Time Domain)');
xlabel('Time(s)');
ylabel('Rectified Envelope Difference');

