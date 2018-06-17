clc
N = 10;
Fs = 8000;

%type = "Type II";
%A = @Low_pass_amp;

type = "Type IV";
A = @High_pass_amp;

%type = "Type IV";
%A = @Diff_amp;

design_filter(N,type,Fs,A) 
%N: no of taps of filter 
%type: FIR filter type (Type I, Type II, Type III and Type IV) 
%Fs: sampling frequency 
%A: function handle of desired amplitude response 