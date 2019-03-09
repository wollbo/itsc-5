%% main
% Entropy Constrained --> uniform quantization

C = [4 sqrt(2);sqrt(2) 4];

[U, Ct] = diagonalize(C);

D = [0.01:0.01:1];

H = 1/2 * log2(C(1,1)./D) + 1/2 * log2(2*pi*exp(1)/12);
Ht = 1/2 * log2(Ct(1,1)./D) + 1/2 * log2(2*pi*exp(1)/12);
 
figure(1)
plot(D, H, D, Ht)
legend('Gaussian source', 'KL-transformed Gaussian source');
title('Distortion rates of Gaussian sources')

%%

figure(2)
mu = [0 0];
x1 = -3:.2:3;
x2 = x1;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,C);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 3 -3 3 0 .1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
title('Gaussian PDF without transform');

%%

figure(3)
mu = [0 0];
y1 = -3:.2:3;
y2 = y1;
[Y1,Y2] = meshgrid(y1,y2);
G = mvnpdf([Y1(:) Y2(:)],mu,Ct);
G = reshape(G,length(y2),length(y1));
surf(y1,y2,G);
caxis([min(G(:))-.5*range(G(:)),max(G(:))]);
axis([-3 3 -3 3 0 .1])
xlabel('y1'); ylabel('y2'); zlabel('Probability Density');
title('Gaussian PDF with KL-transform');
