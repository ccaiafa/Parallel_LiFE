
%% load data to test
disp('loading dataset for testing...')
disp('loading fe_structure for FP subject in STN dataset ...')
feFileName = fullfile(feDemoDataPath('STN','sub-FP','fe_structures'), ...
'fe_structure_FP_96dirs_b2000_1p5iso_STC_run01_SD_PROB_lmax10_connNUM01.mat');
load(feFileName)

%% Define input variables for the optimization using the BB - Nonnegative least Squares algorithm
% INPUTS:
%   - M is a tensor decomposition of matrix M
%   - y is a long vector
%   - w0 is the initial condition for coefficients
%   - opt includes several options for the optimization (Number of iterations, thresholds, etc.)
% OUTPUT:
%   - w is a sparse non-negative vector of coefficients resulting of
%   computing the following optimization problem:
%   Min_w ||M*w - y||^2
M           = fe.life.M;
nVoxels     = size(M,2);
nBvecs      = size(M.DictSig,1);
nFibers     = size(M,3);
dsig        = reshape(fe.life.diffusion_signal_img',[1,nVoxels*nBvecs]);
y           = (dSig - reshape(repmat( ...
                mean(reshape(dSig, nBvecs, nVoxels),1),...
                nBvecs,1), size(dSig)))';
w0          = zeros(nFibers,1);

opt.maxit   = 50;

clear fe; % free memory

%% Call optimization (BBNNLS algorithm)
tic
w = bbnnls(M,y,w0,opt);

Time = toc;
disp(['Total time for ', num2str(opt.maxit),' iterations =',num2str(Time/60/60),' hours']);




