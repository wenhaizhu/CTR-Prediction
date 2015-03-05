function [mean, covariance, count] = preprocess(data)
%% function proprocess(data) return mean, covariance, count
% mean is the mean value of the data
% covariance is the covariance of the data
% count is the number of row of the data
outds = mapreduce(data, @meanMap, @meanReducer);
results = readall(outds);
count = results.Value{1};
mean = results.Value{2};
covariance = results.Value{3};