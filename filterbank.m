function output = filterbank(audio, bandlimits, Fs)

% filter design as outlined by Scheirer, 1998
% filterbank consists of:
%   lowpass filter @200Hz
%  4 bandpass filters with bands 200-400,400-800,800-1600, 1600-3200
%   highpass filter @3200Hz
% Each filter is implemented with a 6th order elliptic filter, 3dB ripple pass band,
% 40dB rejection in stopband


filtA = zeros(length(bandlimits),length(audio));                    %Preallocating arrays
rectA = zeros(length(bandlimits),length(audio));            
% hannWindow = zeros(length(bandlimits),length(audio));
    Total=0;
% pass audio through filterbank & rectify outputs 
    filtA(1,:) = filter(lowPass200,audio);
    rectA(1,:)= abs(filtA(1,:)); 
    filtA(2,:) = filter(bandPass1,audio);
    rectA(2,:)= abs(filtA(2,:)); 
    filtA(3,:) = filter(bandPass2,audio);
    rectA(3,:)= abs(filtA(3,:)); 
    filtA(4,:) = filter(bandPass3,audio);
    rectA(4,:)= abs(filtA(4,:)); 
    filtA(5,:) = filter(bandPass4,audio);
    rectA(5,:)= abs(filtA(5,:)); 
    filtA(6,:) = filter(highPass3200,audio);
    rectA(6,:)= abs(filtA(6,:)); 
    
    
    Total = sum(filtA); 
%     disp(size(filtA));

 
%convert time domaim
N=length(Total');
t = linspace(0, N/Fs, N);

%convert frequency domain
NFFT = length(Total');
Y = fft(Total',NFFT);
F = ((0:1/NFFT:1-1/NFFT)*Fs).';


% %Graph
% figure('Name','After Filterbank');
% subplot(2,1,1);
% plot(t, Total','r');
% title('Signal (Time Domain)')
% xlabel('Time(s)')
% ylabel('Relative Signal Magnitude')
% 
% subplot(2,1,2);
% plot(F,Y,'b')
% title('Signal (Frequency Domain)')
% xlabel('Frequency(Hz)')
% ylabel('Relative Signal Magnitude')



output=rectA;

     

