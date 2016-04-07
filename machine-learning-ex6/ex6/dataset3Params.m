function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

C_values = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma_values = [0.01 0.03 0.1 0.3 1 3 10 30];

min_err = inf;

for i=1:length(C_values)
  for j=1:length(sigma_values)
    c_curr = C_values(i);
    sigma_curr = sigma_values(j);
    model= svmTrain(X, y, c_curr, @(x1, x2) gaussianKernel(x1, x2, sigma_curr));
    pred = svmPredict(model, Xval);
    curr_err = mean(double(pred ~= yval)); %mean((pred - yval).^2);
    if(curr_err < min_err)
      fprintf('Pridiction error updated!\n');
      C = c_curr;
      sigma = sigma_curr;
      min_err = curr_err;
      fprintf('[C, sigma, err] = [%f %f %f]\n', C, sigma, min_err);
    end
  end
end  

% =========================================================================

end
