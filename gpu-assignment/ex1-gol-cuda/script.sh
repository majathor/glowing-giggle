#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --partition=gpuq
#SBATCH --time=00:00:10
#SBATCH --export=NONE

module use /group/courses0100/software/nvhpc/modulefiles
module load nvhpc/21.9
module load gcc/9.2
#srun nvcc -o myprogram myprogram.cu # for CUDA C++
#srun nvfortran -o myprogram myprogram.cuf # for CUDE FORTRAN

echo "Compiling code"
srun --export=all -u -n 1 make clean
srun --export=all -u -n 1 make

echo "Running C"
srun --export=all -u -n 1 bin/game_of_life_c 5 50 10

#echo "Running CUDA"
#srun --export=all -u -n 1 bin/game_of_life_cuda 5 50 10
