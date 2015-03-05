function meanMap(t,~,intermKVStore)
%% meanMap Mapper function for mapreduce to compute mean, covariance and count

x = changeData(t);

% Compute and save the count, mean, and covariance
n = size(x,1);
m = mean(x,1);
c = cov(x,1);

% Store these as a single item in the intermediate key/value store
add(intermKVStore,'key',{n m c})
end