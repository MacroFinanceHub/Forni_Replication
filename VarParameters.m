function [B C X u] = VarParameters(y,p,c)
n=size(y,2); 
[Y X] = VAR_str(y,c,p);       % yy and XX all the sample
T=size(Y,1);
Bols=inv(X'*X)*X'*Y;
VecB=reshape(Bols,n*(n*p+1),1);
B=companion(VecB,p,n,c);
C=Bols(1,:)';
u=Y-X*Bols;
CovU=cov(u);
u=u';
sh=(inv(chol(CovU)')*u)';

end