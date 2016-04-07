function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%


admitted = find(y==1);
not_admitted = find(y==0);

plot(X(admitted,1), X(admitted,2),"k+","LineWidth",2,"MarkerSize",5);
plot(X(not_admitted,1), X(not_admitted,2),"ko","MarkerFaceColor","r","MarkerSize",5);



% =========================================================================



hold off;

end
