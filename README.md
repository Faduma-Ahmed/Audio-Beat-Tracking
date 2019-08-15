# Audio-Beat-Tracking

I adapted a beat detection algorithm from the paper ["Tempo and beat analysis of acoustic musical signals"(Scheirer, 1998)](http://www-labs.iro.umontreal.ca/~pift6080/H09/documents/papers/scheirer_jasa.pdf).
This algorithm processes an audio input and outputs the frequency(tempo) and phase(duration of beat) of the audio.
Steps.

#### BLOCK DIAGRAM
![picture](block_diagram.png|height="25%" width="25%")

#### 1.Filterbank: 
This filterbank has 6 bands each covering one-octave range. The lowest band is a 200Hz lowpass filter, and the highest band is  
a highpass filter with a cut-off off 3200Hz. The other 4 bands are band pass. Each filter was made with a 6th order, elliptic filter with a 3 dB passband ripple and a 40dB stopband ripple.


#### 2.Envelope Extraction 
The outputs from the filterbank was rectified and convolved with a 0.2s half-Hanning window

#### 3.Differentiator & Half-Wave Rectifier
#### Comb Filter
#### Peak-Picking

#### Results








