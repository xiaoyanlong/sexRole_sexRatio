#!/bin/bash

#!!! adjust the time quota !!!

#SBATCH --time=20:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=8000
#SBATCH --cpus-per-task=16
#SBATCH --partition=single

datadir="/pfs/work7/workspace/scratch/fr_xl1011-data/evosexrole_sexratio"
./bin/evorole --force param=mate0.002.json rep=5 outdir=$datadir/2024-06-11_mate0.002

