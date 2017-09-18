function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
%X = [ones(m, 1), X];
h = sum(theta'.*X, 2);
%%% remember not to regularize theta0!!!
J = 0.5/m * sum((h-y).^2) + lambda/2/m*sum(theta(2:end).^2);

grad(1,:) = 1/m*sum((h-y)'*X(:,1));
%%% check out the difference!!!
size(((h-y)'*X(:, 2:end)));
size( lambda/m*theta(2:end,:));
grad(2:end, :) = 1/m*((h-y)'*X(:, 2:end)) + lambda/m*theta(2:end,:)';
%grad([2:rows(grad)],:) = 1/m*(h-y)'*X(:,[2:columns(X)]) + lambda/m*theta([2:rows(theta)],:)';








% =========================================================================

grad = grad(:);

end
