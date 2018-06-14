function design_filter(Fc,Fs,N,window) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 
 Wc = 2*(Fc/Fs);
 M = (N-1)/2;
if window == "Rectangular"
    for i = 0:N-1
        num(1,i+1) = 1;
    end
    dem = 1;    
end

if window == "Hamming"
    for i = 0:N-1
        num(1,i+1) = 0.54+0.46*cos(((i-M)*pi)/M);
    end
    dem = 1;    
end

if window == "Hanning"
    for i = 0:N-1
        num(1,i+1) = 0.5+0.5*cos(((i-M)*pi)/M);
    end
    dem = 1;    
end

if window == "Bartlett"
    for i = 0:N-1
       if(i<=M)
           num(1,i+1) = (2*i)/(N-1);
       else
           num(1,i+1) = 2-((2*i)/(N-1));
       end
    end
    dem = 25;    
end
freqz(num,dem);
fvtool(num,dem,'magnitude');

fvtool(num,dem,'polezero');
fvtool(num,dem,'impulse');

end