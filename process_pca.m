function [latent, pcaCoef] = process_pca(covariance)
%% function process_pca 
% compute latent as the variance
% pcaCoef is the eigenvector
 latent = diag(covariance);
 s = sqrt(latent);
 correlation = covariance./(s*s');
 [~, ~, pcaCoef] = svd(correlation);