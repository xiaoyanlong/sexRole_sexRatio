#!/bin/bash

#!!! adjust the time quota !!!

#SBATCH --time=00:10:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --mem=100
#SBATCH --cpus-per-task=16
#SBATCH --partition=single

datadir="/pfs/work7/workspace/scratch/fr_xl1011-data/sexrole_sexratio"
./bin/evorole --force param=test.json rep=1 outdir=$datadir/test

