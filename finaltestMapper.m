function finaltestMapper( pcaCoef, k, w, mean, variance, data, ignore, intermKVStore )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

id = uint64(data.id);
X = changeData(data);
X = normalize(X, mean, variance);

pcaCoef = pcaCoef(:, 1 : k);

X1 = X*pcaCoef;
X1 = [ones(size(X1, 1), 1) X1];
Y_label = 1 ./ (1+exp(X1*w));

Y_label(Y_label >= 0.5) = 1;
Y_label(Y_label < 0.5) = 0;
tempresult=[id Y_label];

add(intermKVStore, 'key', {tempresult});


