function D_High_pass = High_pass_amp(f,Fc)
    for i = 1:length(f)
        if f(1,i) < Fc
            D_High_pass(i,1) = 0;
        else
            D_High_pass(i,1) = 1;
        end
    end
end