function design_filter(N,type,Fs,A) 
%N: no of taps of filter 
%type: FIR filter type (Type I, Type II, Type III and Type IV) 
%Fs: sampling frequency 
%A: function handle of desired amplitude response 

%Declarations
%Fc = 2*pi*(1000/Fs); %lowpass
Fc = 2*pi*(3000/Fs); %high pass
%Fc = 2*pi*(2000/Fs)
H_d = zeros(1,N);
%Creating Frequencies
if(mod(N,2) == 1)
    for k = 0:(N-1)/2
        f(1,k+1) = (2*pi*k)/N;
    end
else
   for k = 0:N/2
       f(1,k+1) = (2*pi*k)/N;
end

%Types
if type == "Type II"
    %Symmetric
    D = A(f,Fc); %lowpass
    phi = (pi*(N-1))/N;
    H_d(1,1) = D(1,1);
    for k = 2 : length(f)
        phase = exp(-1i*phi*(k-1));
        H_d(1,k) = D(k,1)*phase; 
        H_d(1,N+2-k) = D(k,1)*conj(phase);
    end
end
   
if type == "Type IV"
    %Anti-Symmetric
    D = 1i*A(f,Fc); %Highpass
    phi = (pi*(N-1))/N;
    H_d(1,1) = D(1,1);
    for k = 2 : length(f)
        phase = exp(-1i*phi*(k-1));
        H_d(1,k) = D(k,1)*phase; 
        H_d(1,N+2-k) = -D(k,1)*conj(phase);
    end
end

h = real(ifft(H_d));

fvtool(h,1,'magnitude');
fvtool(h,1,'Phase');
fvtool(h,1,'polezero');
fvtool(h,1,'impulse');
end 