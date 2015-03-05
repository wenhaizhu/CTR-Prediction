function splitReducer( ~,intermValIter,outKVStore )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
data_id1 = [];
data_id2 = [];
data_id3 = [];
data_id4 = [];
data_id5 = [];

while hasnext(intermValIter)
    rst = getnext(intermValIter);
    data_id1 = [data_id1; rst{1}];
    data_id2 = [data_id2; rst{2}];
    data_id3 = [data_id3; rst{3}];
    data_id4 = [data_id4; rst{4}];
    data_id5 = [data_id5; rst{5}];
end

add(outKVStore, 'id1', data_id1);
add(outKVStore, 'id2', data_id2);
add(outKVStore, 'id3', data_id3);
add(outKVStore, 'id4', data_id4);
add(outKVStore, 'id5', data_id5);

end

