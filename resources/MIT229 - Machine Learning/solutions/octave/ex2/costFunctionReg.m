function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 


%% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

% Initialize some useful values
m = length(y); % number of training examples
n = length(theta);
% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

hs = zeros(m, 1);
for i = 1:m
    hs(i) = h(theta, X(i, :)');
end

J = y .* log(hs) + (1-y) .* log(1 - hs);
J = sum(J);
J = -J/m;

J = J + (lambda / (2 * m) ) * sum(theta(2:n) .^ 2);

for j = 1:n
    s = zeros(m,1);
    for i = 1:m
        s(i) = (hs(i) - y(i)) * X(i, j);
    end
    grad(j) = (1/m) * sum(s);
    
    if j > 1
        grad(j) = grad(j) + (lambda / m) * theta(j);
    end
end

% =============================================================

end
