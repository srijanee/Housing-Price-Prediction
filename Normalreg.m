function [theta] = normalEqn(X, Y,lambda)

theta = zeros(size(X, 2), 1);
n = size(X,2);
mat = zeros(size(X,2),size(X,2));

for i = 2:n
	mat(i,i)=1;
end

size(mat)

size(X'*X)

theta = (  pinv( X'*X + lambda*mat ) * (X'*Y)  )

end