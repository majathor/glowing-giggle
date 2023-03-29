#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --gres=gpu:1
#SBATCH --partition=gpuq
#SBATCH --time=00:00:10
#SBATCH --export=NONE

module use /group/courses0100/software/nvhpc/modulefiles
module load nvhpc/21.9
#srun nvcc -o myprogram myprogram.cu # for CUDA C++
#srun nvfortran -o myprogram myprogram.cuf # for CUDE FORTRAN

srun bin/game_of_life_c 5 50 10
