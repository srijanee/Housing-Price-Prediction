function [J grad] = costFunctionreg(theta,X,Y,lambda)

grad=zeros(size(theta));

m = length(Y);

J = sum((X*theta - Y).^2)/(2*m)+((theta(2:end,:))'*(theta(2:end,:)))*lambda/(2*m);

grad(1)=X(:,1)'*(X*theta - Y)/m;


grad(2:end) = X(:,2:end)'*(X*theta - Y)/m + lambda/m*theta(2:end); 

end