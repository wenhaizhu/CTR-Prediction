function [result ] = main( train_file_path, test_file_path )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
%read Data
train_ds = datastore(train_file_path, 'TreatAsMissing', 'NA');
test_ds = datastore(test_file_path, 'TreatAsMissing', 'NA');

%calculate mean, variace, and pcaCoef
[mean, covariance, ~] = preprocess(train_ds);
[variance, pcaCoef] = process_pca(covariance);
variance = variance';
%size of pcaCoef
K = size(pcaCoef, 2);

%accu
avgAccu = [];

%train data
for k = 1 : K
    [ id1, id2, id3, id4, id5 ] = split_id(train_ds);
    %5 times test
    accu = 0;
    %1st
    test_index = id1;
    train_index = [id2; id3; id4; id5];
    %train
    w = logistic_regression(pcaCoef, k, mean, variance, train_index, train_ds);
    %test
    accu = accu + testAccu( pcaCoef, k, w, mean, variance,test_index, train_ds );
    
    %2nd
    test_index = id2;
    train_index = [id1; id3; id4; id5];
     %train
    w = logistic_regression(pcaCoef, k, mean, variance, train_index, train_ds);
    %test
    accu = accu + testAccu( pcaCoef, k, w, mean, variance,test_index, train_ds );
    
    %3rd
    test_index = id3;
    train_index = [id1; id2; id4; id5];
     %train
    w = logistic_regression(pcaCoef, k, mean, variance, train_index, train_ds);
    %test
    accu = accu + testAccu( pcaCoef, k, w, mean, variance,test_index, train_ds );
    
    %4th
    test_index = id4;
    train_index = [id1; id2; id3; id5];
     %train
    w = logistic_regression(pcaCoef, k, mean, variance, train_index, train_ds);
    %test
    accu = accu + testAccu( pcaCoef, k, w, mean, variance,test_index, train_ds );
    
    %5th
    test_index = id5;
    train_index = [id1; id2; id3; id4];
     %train
    w = logistic_regression(pcaCoef, k, mean, variance, train_index, train_ds);   
    %test
    accu = accu + testAccu( pcaCoef, k, w, mean, variance,test_index, train_ds );
    
    avgAccu = [avgAccu, accu/5];
end

%choose how many column to choose
[~, k] = max(avgAccu);
k
%train all data
%train
w = logistic_regression(pcaCoef, k, mean, variance, [], train_ds);
%test
[mean, covariance, ~] = preprocess(test_ds);
[variance, pcaCoef] = process_pca(covariance);
variance = variance';
result  = finaltest( pcaCoef, k, w, mean, variance, test_ds );
%test 
display('end');
end

