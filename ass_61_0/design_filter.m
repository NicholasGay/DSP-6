function design_filter(Fc,Fs,N,window) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 

Wc = 2*pi*(Fc/Fs);
for i = 0:N
    num(1,i+1) = sinc(Wc*(i-N));
end
dem = pi/Wc;
freqz(num,dem);
end