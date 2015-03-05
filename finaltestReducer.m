function finaltestReducer(~,intermValIter,outKVStore)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
result = [];
while hasnext(intermValIter)
    rst = getnext(intermValIter);
    result = [result; rst{1}];
end

add(outKVStore, 'result', result);
end

