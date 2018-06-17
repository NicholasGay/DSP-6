clc
Fs = 8000;
Wp = 2*pi*(2000/Fs);
Ws = 2*pi*(2200/Fs);
N =20;
type = "Four";
K = 8;
f = linspace(0.0001,pi,K*(N-1));
D = zeros(1,length(f));
W = zeros(1,length(f));
for i = 1:length(f)
    if(f(1,i) <= Wp)
        D(1,i) = f(1,i);
        W(1,i) = 1/f(1,i);
    elseif(f(1,i) >= Ws)
        D(1,i) = 0;
        W(1,i) = 1;
    else
        W(1,i) = 0;
    end
end
design_filter(N,type,Fs,f,D,W) 
%N: no of taps of filter 
%type: FIR filter type (Type I, Type II, Type III and Type IV) 
%Fs: sampling frequency 
%f: frequency grid (vector of frequency points in Hz) 
%D: vector containing the values of the desired amplitude response at the frequencies specified in f 
%W: vector containing the values of the weighting function at the 
%frequencies specified in f