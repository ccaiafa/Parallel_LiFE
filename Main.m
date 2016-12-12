
%% load data to test
disp('loading dataset for testing...')
load 'variables.mat'

%% Compute the optimization using the BB - Nonnegative least Squares algorithm
% INPUTS:
%   - M is a tensor decomposition of matrix M
%   - y is a long vector
%   - w0 is the initial condition for coefficients
%   - opt includes several options for the optimization (Number of iterations, thresholds, etc.)
% OUTPUT:
%   - w is a sparse non-negative vector of coefficients resulting of
%   computing the following optimization problem:
%   Min_w ||M*w - y||^2

opt.maxit = 50;

tic
w = bbnnls(M,y,w0,opt);

Time = toc;
disp(['Total time for ', num2str(opt.maxit),' iterations =',num2str(Time/60/60),' hours']);




