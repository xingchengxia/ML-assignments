function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


h = sigmoid(sum(theta'.*X, 2));%%%last stuck
J = 1/m*sum(sum((-y.*log(h)-(1-y).*log(1-h)), 2)) + (lambda/2*m)*theta([2:size(theta, 1)],:).^2;
%grad(1,:) = 1/m*sum(((h-y).*X));
size(grad)
size(grad(1,:))
size(1/m*sum(((h-y).*X(1,:))))
grad(1,:) = 1/m*sum(((h-y).*X(1,:)));
grad([2:rows(theta)],:) = 1/m*sum(((h-y)([2:rows(X)],:).*X([2:rows(X)],:))) + lambda/m*theta([2:size(theta, 1)],:);



% =============================================================

end
