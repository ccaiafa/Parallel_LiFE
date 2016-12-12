function [ w ] = Mtransp_times_b(atoms,voxels,fibers,values,D,Y,nFibers)
%% INPUT:
% atoms, voxels, fibers: are vectors with the 3D indices in the sparse core
%                        tensor Phi.
% values: is a vector with the non-zero entries of tensor Phi
% D: is a (nTheta x nAtoms) matrix, the dictionary matrix.
% Y: is a (nTheta x nVoxels) matrix containing the diffusion measurements
% nFibers: is the number of fascicles
%
%% OUTPUT:
% w: is a (nFibers x 1) vector that results from computing the
% matrix by vector operation w = M'*vec(Y), where b=vec(Y) is a
% (nTheta*nVoxels x 1) vector version of matrix Y

w = zeros(nFibers,1);
for k = 1:length(values)
    w(fibers(k)) = w(fibers(k)) + (D(:,atoms(k)))'*Y(:,voxels(k))*values(k);
end

