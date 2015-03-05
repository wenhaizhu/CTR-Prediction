function [ accu ] = testAccu( pcaCoef, k, w, mean, variance,test_id, ds )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
Mapper = @(data, ingore,  intermKVStore)testMapper( pcaCoef, k, w, mean, variance,test_id, data, ingore,  intermKVStore );
outds = mapreduce(ds, Mapper, @testReducer);
rst = readall(outds);

accu = rst.Value{1};
end

