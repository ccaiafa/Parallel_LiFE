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

### 1. Download/clone this repository (https://github.com/ccaiafa/Parallel_LiFE.git)
* Add the Paralell_LiFE folder to your matlab search path. To do so in the MatLab prompt type: 
```
   >> addpath(genpath('/my/path/to/the/Paralell_LiFE/folder/'))
```
### 2. [Download the Demo Datasets](http://purl.dlib.indiana.edu/iusw/data/2022/20995/Demo_Data_for_Multidimensional_Encoding_of_Brain_Connectomes.tar.gz).
* Download the demo datasets from the repository [doi:10.5967/K8X63JTX](http://purl.dlib.indiana.edu/iusw/data/2022/20995/Demo_Data_for_Multidimensional_Encoding_of_Brain_Connectomes.tar.gz).
* UNTAR the main file Demo_Data_for_Multidimensional_Encoding_of_Brain_Connectomes.tar.gz
* Go inside the folder Demo_Data_for_Multidimensional_Encoding_of_Brain_Connectomes/ and UNZIP the following files: Figs_data.zip, HCP3T.zip, HCP7T, and STN. You can deleted the original .zip files once they are unziped.
* The structures of files and foldes under the main folder should looks like as follows
* feDemoDataPath.m
* Figs_data/
* HCP3T/
* HCP7T/
* README.txt
* STN/
* 
* Add the main data folder (Demo_Data_for_Multidimensional_Encoding_of_Brain_Connectomes/) to your matlab search path. To do so in the MatLab prompt type:
```
   >> addpath(genpath('/my/path/to/the/Demo_Data_for_Multidimensional_Encoding_of_Brain_Connectomes/'))
```
### 3 [Generate mex files for your system](run the script /Generate_mex_files.m).
This script generate the mex files using the C code provided in the folder /mexfiles/

### 4. [Run the main script](/Main.m).
This script extract the data from one brain and run the optimization using only 50 iterations. The number of iterations can be changed through the variable opt.maxit.
