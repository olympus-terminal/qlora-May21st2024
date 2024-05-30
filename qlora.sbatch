#!/bin/bash

#SBATCH -o slurm-logs/arrayJob_%A_%a.out
#SBATCH -e slurm-logs/arrayJob_%A_%a.err
#SBATCH -a 1
#SBATCH --mem=40GB
#SBATCH --time=96:00:00
#SBATCH -p nvidia
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=10

module load cuda/12.2.0
conda activate /scratch/drn2/software/conda-qlora/

python qlora.py --dataset="/scratch/drn2/PROJECTS/AI/training_100s_prophecy-2.json" --dataset_format="self-instruct"
