function  splitMapper(data, ~,  intermKVStore)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%delete NA data
data(isnan(data.id), :) = [];

data_size = size(data, 1);
[ idx1, idx2, idx3, idx4, idx5 ] = randomDivide(data_size);
data_id1 = data.id(idx1);
data_id2 = data.id(idx2);
data_id3 = data.id(idx3);
data_id4 = data.id(idx4);
data_id5 = data.id(idx5);

add(intermKVStore, 'key', {data_id1 data_id2 data_id3 data_id4 data_id5});
end

