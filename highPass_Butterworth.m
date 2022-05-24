
fcs = 5;
fcp = 20;
fs = 1000;

Wp = fcp*2/fs; Ws = fcs*2/fs;       % Normalizing frequency
Rp = 1; Rs = 40;
[n,Wn] = buttord(Wp,Ws,Rp,Rs);      % Gives minimum order of filter
[b,a] = butter(n,Wn, 'high');       % Butterworth filter design
SOS = zp2sos(z,p,k);                % Converts to second order sections
freqz(SOS,1024,1000)                % Plots the frequency response

% [b,a] = butter(n,Wn, 'high');       % Butterworth filter design
% fvtool(b,a)