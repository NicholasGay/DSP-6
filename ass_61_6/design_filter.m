function design_filter(Fc,trans,error,Fs) 
% Fc: cut-off frequency 
% Fs: sampling frequency 
% N: no. of taps of filter 
% window: type of window end 
A = -mag2db(error);

if A > 50
    beta = 0.1102*(A-8.7);
end

if (21<=A)&&(A<=50)
    beta = 0.5842*((A-21)^(0.4))+0.07786*(A-21);
end

if(A<21)
    beta = 0;
end

M = ceil((A-8)/(2.285*trans));
%M = 37;
alpha = M/2;

Wc = 2*pi*(Fc/Fs);
I_beta = besseli(0,beta);
for i = 0:M
    J_num = sqrt(1-(((i-alpha)/alpha)^2));
    I_num = besseli(0,(beta*J_num));
    num(1,i+1) = (I_num/I_beta)*(sin(Wc*(i-alpha))/(pi*(i-alpha)));
end
dem = [1];
fvtool(num,dem,'Magnitude');
fvtool(num,dem,'Phase');
fvtool(num,dem,'polezero');
fvtool(num,dem,'impulse');

end