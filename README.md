# Parallel_LiFE
## About
This set of routines and associated dataset provide an example of the optimization problem solved as part of the LiFE method as implemented in the Encode Toolbox (https://github.com/brain-life/encode.git).

In this example, only 50 iterations of the BBNNLS algorithm are performed. In a real application we use 500 or more iterations.

The most computationally intensive tasks are the computations of matrix by vector products, which are performed through the folloging functions (implemented as mex files):

- Mtransp_times_b(), i.e. w = M'*b

- M_times_w(), i.e y = M*w

We believe these two operations can be made in parallel by building the appropriate blocks of data within the matrix and the vector.

The above functions make use of the tensor decomposition format of the very large matrix M (details of the decomposition are provided in the paper here https://arxiv.org/pdf/1505.07170.pdf.

For clarity, we have included a Matlab version of these two functions inside the folder \mexfiles\ with the names 'Mtransp_times_b' and 'M_times_w'. Please take a look into these very short codes. Note that both functions are reduced to simple forloops.

## Purpose of the repository: 
To allow code developers to reduce the computation time of this task by using parallel implementation.

## Instructions to run this code

### 1. Download the repository ()
