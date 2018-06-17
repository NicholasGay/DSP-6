function design_filter(N,type,Fs,f,D,W) 
%N: no of taps of filter 
%type: FIR filter type (Type I, Type II, Type III and Type IV) 
%Fs: sampling frequency 
%f: frequency grid (vector of frequency points in Hz) 
%D: vector containing the values of the desired amplitude 
%response at the frequencies specified in f 
%W: vector containing the values of the weighting function at the 
%frequencies specified in f

if type == "Two"
    M = N-1;
    L = (M-1)/2;
    Q = cos(f/2);
    %creating W_q
    for i = 1:length(Q)
        W_v(1,i) = W(1,i)*Q(1,i);
    end
    W_q = diag(W_v);
    %Creating Dq
    for i = 1:length(Q)
        D_q(1,i) = D(1,i)/Q(1,i);
    end
    %Creating U
    for i = 0:L
        U(:,i+1) = cos(i*(f.'));
    end
    
    %computing P
    inversepart = (U.')*(W_q^2)*U;
    P = inversepart\((U.')*(W_q^2)*(D_q.'));
    
    %computing b
    b(1,1) = P(1,1) + 0.5*P(2,1);
    b(L+1,1) = 0.5*P(L+1,1);
    for m = 2:L
        b(m,1) = 0.5*(P(m,1)+P(m+1));
    end
    %getting H
    for m = 1:L+1
        h(1,(L+1-m)+1) = b(m,1)*0.5;
    end
    for n = 1:L+1
        h(1,N-n+1) = h(n);
    end
end

if type == "Four"
    M = N-1;
    L = (M-1)/2;
    Q = sin(f/2);
    %creating W_q
    for i = 1:length(Q)
        W_v(1,i) = W(1,i)*Q(1,i);
    end
    W_q = diag(W_v);
    %Creating Dq
    for i = 1:length(Q)
        D_q(1,i) = D(1,i)/Q(1,i);
    end
    %Creating U
    for i = 0:L
        U(:,i+1) = cos(i*(f.'));
    end
    
    %computing P
    inversepart = (U.')*(W_q^2)*U;
    P = inversepart\((U.')*(W_q^2)*(D_q.'));
    
    %computing d
    d(1,1) = P(1,1) - 0.5*P(2,1);
    d(L+1,1) = 0.5*P(L+1,1);
    for m = 2:L
        d(m,1) = 0.5*(P(m,1)-P(m+1));
    end
    %getting H
    for m = 1:L+1
        h(1,(L+1-m)+1) = d(m,1)*0.5;
    end
    for n = 1:L+1
        h(1,N-n+1) = -h(n);
    end
end

fvtool(h,1,'Magnitude');
fvtool(h,1,'Phase');
fvtool(h,1,'polezero');
fvtool(h,1,'impulse');

end