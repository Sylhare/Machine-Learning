function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

%% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%
% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% a1 = a^(1)
a1 = [ones(m, 1), X];

% a2 = a^(2)
z2 = Theta1 * a1';
a2 = sigmoid(z2);
a2 = [ones(1, size(a2, 2)); a2];

% a3 = a^(3)
z3 = Theta2 * a2;
a3 = sigmoid(z3);

% calculating max on the transpose of a3: probability for each classifier
[val, p] = max(a3', [], 2);

% =========================================================================
end
