function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples
n = size(theta);
% You need to return the following variables correctly 
J = 0;
grad = zeros(n, 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%
%theta = initial_theta;
hs = zeros(m, 1);

for i = 1:m
    hs(i) = h(theta, X(i, :)');
end

J = y .* log(hs) + (1-y) .* log(1 - hs);
J = sum(J);
J = -J/m;

for j = 1:n
    s = zeros(m,1);
    for i = 1:m
        s(i) = (hs(i) - y(i)) * X(i, j);
    end
    grad(j) = (1/m) * sum(s);
end

% =============================================================
end
