function testMapper( pcaCoef, k, w, mean, variance,test_id, data, ignore, intermKVStore )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
id = data.id;
[~, index, ~] = intersect(id, test_id);
if ~isempty(index)

    X = changeData(data(index, :));
    X = normalize(X, mean, variance);
    Y = data.click(index, :);
    pcaCoef = pcaCoef(:, 1 : k);

    X1 = X*pcaCoef;
    X1 = [ones(size(X1, 1), 1) X1];
    Y_label = 1 ./ (1+exp(X1*w));

    Y_label(Y_label >= 0.5) = 1;
    Y_label(Y_label < 0.5) = 0;
    accuNum = sum(Y_label == Y);
    count = size(Y, 1);

    add(intermKVStore, 'key', {accuNum count});
end

