function b = logistic_regression(eig_vec_m, k, mean, variance, train_id, ds)

b = [];

for iteration = 1:5
    b_old = b;
    iteration

    % Here we will use an anonymous function as our mapper. This function
    % definition includes the value of b computed in the previous
    % iteration.
    mapper = @(t,ignore,intermKVStore) trainMapper(b, eig_vec_m, k, mean, variance, train_id, t, ignore,intermKVStore);

    result = mapreduce(ds, mapper, @trainReducer);

    tbl = readall(result);
    b = tbl.Value{1};

    % Stop iterating if we have converged.
    if ~isempty(b_old) && ...
       ~any(abs(b-b_old) > 1e-6 * abs(b_old))
       break
    end
end