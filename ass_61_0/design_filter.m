function design_filter(Fc,Fs,N,window) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 

Wc = 2*(Fc/Fs);
M = (N-1)/2;
for i = 0:(N-1)
    num(1,i+1) = Wc*sinc(Wc*(i-(M)));
end
dem = [1];
freqz(num,dem);
fvtool(num,dem,'polezero');
fvtool(num,dem,'impulse');

end