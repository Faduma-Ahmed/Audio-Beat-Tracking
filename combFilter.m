function output = combFilter(signal, bandLimits, Fs)
%for each enveloped channel of the frequency filterbank, filterbank of comb filters is implemented
% The output of these resonator filterbanks is summed and the strongest
% periodic component is determined. The frequency of the resonator
% with the maximum energy output is selected as the tempo of the signal

% to improve accuracy, function is called recursively

% defaults
minBPM= 60; % 1Hz
maxBPM=240; % 3Hz
beatRes=1;  % beat resolution 
maxEnergy=0;
nSignal = length(signal);
nBands = length(bandlimits);
nPulse = 3;

 for i = 1:nBands
    dft(:,i)=fft(sig(:,i)); % convert to frequency domain 
 end
 
  for bpm = minBPM:beatRes:maxBPM
      
       % Initialize energy and filter to zero(s)
       energy= 0;
       fil= zeros(nSignal,1);
       
       % Calculate interval for each comb filter. (correspond to the particular bpm)
       %           ex. for 120BPM there would be 0.5s betweeen each interval 
       
       interval= floor(120/bpm*Fs);
       
       % Set every nstep samples of the filter to one
        
        
       
       % Convolve the onset signal with the comb filter (convert to
       % frequency domain and multiply)
       
       % Calculate the energy after convolution
       
       % check if energy is greater than previous, if it is, set as maxEnergy

      
  end
  
