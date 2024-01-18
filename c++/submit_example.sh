#!/bin/bash

#!!! adjust the time quota !!!

#SBATCH --time=00:20:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=1000
#SBATCH --cpus-per-task=16
#SBATCH --partition=single

datadir="/pfs/work7/workspace/scratch/fr_xl1011-data/evosexrole"
./bin/evorole --force param=param.json rep=10 outdir=$example

