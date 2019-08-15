function Hd = lowPass200
%LOWPASS200 Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 8.4 and the Signal Processing Toolbox 6.22.
% Generated on: 14-Aug-2019 12:58:38

% Elliptic Lowpass filter designed using FDESIGN.LOWPASS.

% All frequency values are in Hz.
Fs = 4096;  % Sampling Frequency

N     = 6;    % Order
Fpass = 200;  % Passband Frequency
Apass = 3;    % Passband Ripple (dB)
Astop = 40;   % Stopband Attenuation (dB)

% Construct an FDESIGN object and call its ELLIP method.
h  = fdesign.lowpass('N,Fp,Ap,Ast', N, Fpass, Apass, Astop, Fs);
Hd = design(h, 'ellip');

% [EOF]
