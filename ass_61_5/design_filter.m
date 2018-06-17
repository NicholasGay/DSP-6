function design_filter(Fl,Fh,Fs,N,window) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 

Wl = (2*((Fl)/Fs));
shift = Fs/2;
Wh = (2*((Fs/2-Fh)/Fs));
M = (N-1)/2;
for i = 0:(N-1)
    low = Wl*sinc(Wl*(i-(M)));
    high = cos((2*pi*(shift/Fs)*i))*(Wh*sinc(Wh*(i-(M))));
    num(1,i+1) = (0.54+0.46*cos(((i-M)*pi)/M))*(high+low);
end
dem = [1];
fvtool(num,dem,'Magnitude');
fvtool(num,dem,'Phase');
fvtool(num,dem,'polezero');
fvtool(num,dem,'impulse');

end