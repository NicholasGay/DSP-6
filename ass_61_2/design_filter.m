function [num,dem] = design_filter(Fc,Fs,N,window) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 
 Wc = 2*(Fc/Fs);
 M = (N-1)/2;
if window == "Rectangular"
    for i = 0:N-1
        num(1,i+1) = Wc*sinc(Wc*(i-(M)))*1;
    end
    dem = 1;    
end

if window == "Hamming"
    for i = 0:N-1
        num(1,i+1) = Wc*sinc(Wc*(i-(M)))*(0.54+0.46*cos(((i-M)*pi)/M));
    end
    dem = 1;    
end

if window == "Hanning"
    for i = 0:N-1
        num(1,i+1) = Wc*sinc(Wc*(i-(M)))*(0.5+0.5*cos(((i-M)*pi)/M));
    end
    dem = 1;    
end

if window == "Bartlett"
    for i = 0:N-1
       if(i<=M)
           num(1,i+1) = Wc*sinc(Wc*(i-(M)))*((2*i)/(N-1));
       else
           num(1,i+1) = Wc*sinc(Wc*(i-(M)))*(2-((2*i)/(N-1)));
       end
    end
    dem = 1;    
end
if window == "Tukey"
    r = 0.5;
    alpha = linspace(0,1,N);
    for i = 1:N
        x = alpha(1,i);
        if (0<=x)&&(x<r/2)
            y = ((2*pi)/r)*(x-r/2);
            num(1,i) = Wc*sinc(Wc*(i-(M)))*(0.5*(1+cos(y)));
        elseif (r/2<=x)&&(x<(1-r/2))
            num(1,i) = Wc*sinc(Wc*(i-(M)))*1;
        else
            y = ((2*pi)/r)*(x-1+r/2);
            num(1,i) = Wc*sinc(Wc*(i-(M)))*(0.5*(1+cos(y)));
        end
    end
            
    dem = 1;  
end
end