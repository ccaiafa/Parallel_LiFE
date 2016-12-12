function [ Y ] = M_times_w(atoms,voxels,fibers,values,D,w,nTheta,nVoxels)
%% INPUT:
% atoms, voxels, fibers: are vectors with the 3D indices in the sparse core
%                        tensor Phi.
% values: is a vector with the non-zero entries of tensor Phi
% D: is a (nTheta x nAtoms) matrix, the dictionary matrix.
% w: is a (nFibers x 1) vector containing the non-negative weights
% nTheta: is the number of directions
% nVoxels: is the number of voxels
%
%% OUTPUT:
% Y: is a (nVoxels*nTheta x 1) vector that results from computing the
% matrix by vector operation Y = M*w

Y = zeros(nTheta,nVoxels);
for k = 1:length(values)
    %k
    Y(:,voxels(k)) = Y(:,voxels(k)) + D(:,atoms(k))*w(fibers(k))*values(k);
end
Y = Y(:); % vectorization

end