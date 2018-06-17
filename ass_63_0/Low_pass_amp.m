function D_Low_pass = Low_pass_amp(f,Fc)
    for i = 1:length(f)
        if f(1,i) <= Fc
            D_Low_pass(i,1) = 1;
        else
            D_Low_pass(i,1) = 0;
        end
    end
end