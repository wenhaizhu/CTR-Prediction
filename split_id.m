function [ id1, id2, id3, id4, id5 ] = split_id( ds )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
outds = mapreduce(ds, @splitMapper, @splitReducer, 'Display', 'off');
rst = readall(outds);

id1 = rst.Value{1};
id2 = rst.Value{2};
id3 = rst.Value{3};
id4 = rst.Value{4};
id5 = rst.Value{5};

end

