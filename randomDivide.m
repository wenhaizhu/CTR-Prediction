function [ idx1, idx2, idx3, idx4, idx5 ] = randomDivide( num )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
random_index = randperm(num);
idx1 = find(mod(random_index, 5) == 0) ;
idx2 = find(mod(random_index, 5) == 1) ;
idx3 = find(mod(random_index, 5) == 2) ;
idx4 = find(mod(random_index, 5) == 3) ;
idx5 = find(mod(random_index, 5) == 4) ;

end

