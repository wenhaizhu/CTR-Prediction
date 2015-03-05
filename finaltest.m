function [ result ] = finaltest( pcaCoef, k, w, mean, variance, ds )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
Mapper = @(data, ingore,  intermKVStore)finaltestMapper( pcaCoef, k, w, mean, variance, data, ingore,  intermKVStore );
outds = mapreduce(ds, Mapper, @finaltestReducer);
rst = readall(outds);

result = rst.Value{1};
end

