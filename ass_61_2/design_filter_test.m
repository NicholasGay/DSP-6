[num, dem] = design_filter(800,8000,50,"Tukey")

fvtool(num,dem,'magnitude');
fvtool(num,dem,'phase');
fvtool(num,dem,'polezero');
fvtool(num,dem,'impulse');