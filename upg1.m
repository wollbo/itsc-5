%% 1

D = [0.01:0.01:1];

a = 1;

R = -log2(a.*D);

fSLB = figure('Name', 'figures/rateDistortionSLB')
plot(D,R)
title(['SLB Rate Distortion for a = ', num2str(a)])

%%

R_res = -log2(4.*D) + 2*log2(2*sqrt(2/a));

fres = figure('Name', 'figures/rateDistortionRes')
plot(D,R_res)
title(['Resolution Constrained Rate Distortion for a = ', num2str(a)])


%%

R_ent = 1 + log(2/a)/log(2) - log2(4.*D);

fent = figure('Name', 'figures/rateDistortionEnt')
plot(D,R_ent)
title(['Entropy Constrained Rate Distortion for a = ', num2str(a)])

%%

fcomp = figure('Name', 'figures/rateDistortionCompare')
plot(D, R, D, R_res, D, R_ent)
legend('SLB Rate Distortion', 'Constrained Resolution Rate Distortion', 'Constrained Entropy Rate Distortion')
title(['Rate distortions for a = ', num2str(a)])

printToPdf(fSLB)
printToPdf(fres)
printToPdf(fent)
printToPdf(fcomp)

