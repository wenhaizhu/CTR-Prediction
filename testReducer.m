function testReducer(~,intermValIter,outKVStore)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
accuNum = 0;
count = 0;
while hasnext(intermValIter)
    rst = getnext(intermValIter);
    accuNum = accuNum + rst{1};
    count = count + rst{2};
end

accu = accuNum / count * 100;
add(outKVStore, 'accu', accu);
end

