function D_Diff = Diff_amp(f,Fc)
    for i = 1:length(f)
        if f(1,i) <= Fc
            D_Diff(i,1) = f(1,i);
        else
            D_Diff(i,1) = 0;
        end
    end
end