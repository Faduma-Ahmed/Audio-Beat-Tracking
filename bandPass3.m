function Hd = bandPass3
%BANDPASS3 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.4 and the Signal Processing Toolbox 6.22.
% Generated on: 14-Aug-2019 13:11:02

% Elliptic Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 40000;  % Sampling Frequency

N      = 6;     % Order
Fpass1 = 800;   % First Passband Frequency
Fpass2 = 1600;  % Second Passband Frequency
Apass  = 3;    % Passband Ripple (dB)
Astop  = 40;     % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.bandpass('N,Fp1,Fp2,Ast1,Ap,Ast2', N, Fpass1, Fpass2, ...
                      Astop, Apass, Astop, Fs);
Hd = design(h, 'ellip');

% [EOF]