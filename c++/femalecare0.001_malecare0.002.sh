#!/bin/bash

#!!! adjust the time quota !!!

#SBATCH --time=03:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=5000
#SBATCH --cpus-per-task=16
#SBATCH --partition=single

datadir="/pfs/work7/workspace/scratch/fr_xl1011-data/sexrole_sexratio"
./bin/evorole --force param=femalecare0.001_malecare0.002.json rep=1 outdir=$datadir/2024-01-18_femalecare0.001_malecare0.002

