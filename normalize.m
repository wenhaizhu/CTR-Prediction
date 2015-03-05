function data = normalize(data, data_mean, data_var)
data = bsxfun(@minus, data, data_mean);
data = bsxfun(@rdivide, data, data_var);