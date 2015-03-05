function trainMapper(b, eig_vec_m, k, mean, variance, train_id, t, ~,intermKVStore)
%logitMapper Mapper function for mapreduce to perform logistic regression.

% Copyright 2014 The MathWorks, Inc.
% Get data input table and remove any rows with missing values
y = t.click;
id = t.id;
if isempty(train_id)
    x = changeData(t);
else
    [~, index, ~] = intersect(id, train_id);
    x = changeData(t(index, :));
    y = y(index,:);
end
%x = changeData(t);
x = normalize(x, mean, variance);
x = x*eig_vec_m(:,1:k);
x = [ones(size(x,1),1) x];
% Compute the linear combination of the predictors, and the estimated mean
% probabilities, based on the coefficients from the previous iteration
if ~isempty(b)
    % Compute xb as the linear combination using the current coefficient
    % values, and derive mean probabilities mu from them
    xb = sum(repmat(b', size(x,1),1) .* x,2);
    mu = 1./(1+exp(-xb));
else
    % This is the first iteration. Compute starting values for mu that are
    % 1/4 if y=0 and 3/4 if y=1. Derive xb values from them.
    mu = (y+.5)/2;
    xb = log(mu./(1-mu)); 
end

% We want to perform weighted least squares. We do this by computing a sum
% of squares and cross products matrix
%      (X'*W*X) = (X1'*W1*X1) + (X2'*W2*X2) + ... + (Xn'*Wn*Xn)
% where X = X1;X2;...;Xn]  and  W = [W1;W2;...;Wn].
%
% Here in the mapper we receive one chunk at a time, so we compute one of
% the terms on the right hand side. The reducer will add them up to get the
% quantity on the left hand side, and then peform the regression.
w = (mu.*(1-mu));                  % weights
z = xb + (y - mu) .* 1./w;         % adjusted response
X = [x,z];           % matrix of unweighted data
wss = X' * bsxfun(@times,w,X);     % weighted cross-products X1'*W1*X1
% Store the results for this part of the data.
add(intermKVStore, 'key', wss);