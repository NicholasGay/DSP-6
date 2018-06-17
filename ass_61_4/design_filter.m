function design_filter(Fl,Fh,Fs,N,window) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 
shift = (Fh+Fl)/2;
Fc = Fl;
Wc = (2*((Fc)/Fs));
M = (N-1)/2;
for i = 0:(N-1)
    num(1,i+1) = (0.54+0.46*cos(((i-M)*pi)/M))*(cos((2*pi*(shift/Fs))*i))*Wc*sinc(Wc*(i-(M)));
end
dem = [1];
fvtool(num,dem,'Magnitude');
fvtool(num,dem,'Phase');
fvtool(num,dem,'polezero');
fvtool(num,dem,'impulse');

end