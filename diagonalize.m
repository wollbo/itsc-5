function [U, D] = diagonalize(C)

[v,~] = eig(C);

U = norm(v).*v;

D = U*C*U';
