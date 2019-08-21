clear all;close all;clc;

%Default bands  maximum frequencies 
bandlimits = [0 200 400 800 1600 3200];
Fs = 4096;
 
%read file
filename = ('Sample2.mp3');
[y,RealFS] = audioread(filename);

%Resample audio, convert to Mono
[m,n] = size(y);
if n > 1
    MonoY = sum(y,2) / size(y,2);
end

reMonoY = resample(MonoY,Fs,RealFS);
samplesize = size(reMonoY);
  
% play audio
% sound(reMonoY,Fs);

%convert time domaim
N=length(reMonoY);
t = linspace(0, N/Fs, N);

%convert frequency domain
NFFT = length(reMonoY);
Y = fft(reMonoY,NFFT);
F = ((0:1/NFFT:1-1/NFFT)*Fs).';

% %Graph
% figure('Name','Original');
% subplot(2,1,1);
% plot(t, reMonoY,'r');
% title('Original Signal (Time Domain)')
% xlabel('Time(s)')
% ylabel('Relative Signal Magnitude')
% 
% subplot(2,1,2);
% plot(F,Y,'b')
% title('Original Signal (Frequency Domain)')
% xlabel('Frequency(Hz)')
% ylabel('Relative Signal Magnitude')

% run algorithm
 status = 'pass to filterbank...';
 a = filterbank(reMonoY,bandlimits, Fs);
 status = ' half-haning window ...'
 b = hanWindow(a, bandlimits, Fs);
 status = 'Differntiating, Half Wave Rectifying ...'
 c = diff_rect(b);
 


