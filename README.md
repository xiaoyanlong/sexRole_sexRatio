# Transient polymorphisms in parental care strategies drive divergence of sex roles

**Xiaoyan Long and Franz J. Weissing**

email: xiaoyan.long@biologie.uni-freiburg.de and f.j.weissing@rug.nl

---

## Contents

- [Overview](#overview)
- [System Requirements](#system-requirements)
- [Demo](#demo)
- [Results](#results)
- [License](./LICENSE)
- [Issues](#issues)
- [Citation](#citation)



# Overview

We built an individual-based evolutionary simulation to study the evolution of sex roles.The `evorole` folder contains all c++ codes which are needed for simulations. All simulation data are analysed in R (version 4.3.1). The R-script for data analysis can be found in the `R script` folder. In addition, analytical model has also been investigated to complement our simulation study. The `Mathematical analysis` folder contains one pdf file indicating the details of mathematical analysis and one Mathematica notebook showing how we get the evolutionary trajectories and pairwise invasibility plots in this study. 


# System Requirements

## Hardware Requirements

To run the simulations, a standard computer with enough RAM should be enough. For minimal performance, this will be a computer with about 2 GB of RAM. For optimal performance, we recommend a computer with the following specs:

RAM: 16+ GB
CPU: 4+ cores, 1.8 GHz or faster processor
Disk space: 20-50 GB of free space

## Software Requirements

### Individual-based simulations

To run the individual-based simulations, we advise Windows users to download `Visual Studio Community 2019` and Mac users to download the free compiler `XCode`.
The installation of Visual Studio Community 2019 can take around 1.5 to 2 hours depending on your internet speed and the components you have selected to install.
The installation of XCode can take around 2 hours. 

### Analytical models

To run the mathematical models, users should download `Wolfram Mathematica 12.0.0`.

### Data analysis
All simulation data were analysed in R (4.3.1).


# Demo

## Individual-based simulations

### Windows

```
1. Download our `Code`;

2. Open 'evorole.sln' from the folder of 'evorole' directly and run the simulations in Visual Studio 2019 (in XCode if you use Mac).
```
It takes around 5min to run 2 simulations (time steps = 5,000,000) 
on the "normal" laptop (RAM: 16 GB; CPU: 4 cores, 2.1 GHz/core).

### Linux (debian/apt based)

```
sudo apt install cmake
sudo apt install libtbb-dev

git clone https://github.com/xiaoyanlong/evo_sex_role.git
cd ~/evo_sex_role/evorole
mkdir build & cd build
cmake ..
make install
cd ~/evo_sex_role/evorole/bin
./evorole --help
./evorole param=../param.json outdir='your output directory'
```
### High-performance computing (HPC) clusters

Since we have to run thousands of simulations, the HPC clusters were used. If you could also use HPC clusters, you can run the simulations as follows.

```
module load GCC --latest
module load CMake --latest

git clone https://github.com/xiaoyanlong/evo_sex_role.git
cd ~/evo_sex_role/evorole
mkdir build & cd build
cmake ..
make install
cd ~/evo_sex_role/evorole/bin
./evorole --help
./evorole param=../param.json outdir='your output directory'
```

Even though it is possible to run jobs completely from the command line, it is often overly tedious and unorganized to do so. Instead, we used job scripts for the batch jobs.

Using following command, batch jobs will be submitted (`submit_example.sh` is already offered in the folder of `evorole`):

```
cd ~/evosexrole/evorole
# edit submit_example.sh
nano submit_example.sh
sbatch submit_example.sh
```

You need to adjust time quota! This is given as

```
#SBATCH --time=hh:mm:ss
```

Moreover, do not forget to modify the working directory to yours in the job script.

The example runs in roughly 20 minutes (20 simulations in total). --time must be long enough for the simulations to finish. To be sure, oversubscribe your estimated runtime.

# Results

## Parameters

Simulation parameters can be changed in `param.json` (in the folder of `evorole`).

We offered two parameter settings：

1. The baseline scenario where mating is random and only care strategies can evolve.

2. The scenario considering weak parental synergy (σ = 0.05).

If you want to implement other scenarios, such as sexual selection, please remember to turn off random mating and allow female preferences and male ornaments to evolve (m_p: 0.005, m_tau:0.005, random_mating: false). You can use this code script to produce your own simulation data with the parameters you are interested in.

## Outputs

Two CSV files will be produced: 

1. `all_traits`: Average values of female care, male care, female preferences, male ornaments in the population, and population size at each state (pre-mating state, mating state, caring state, juvenile state).

2. `offspring`:  Genetic information of all parents and their offspring.

In the 'Data_demo' folder, you can find representative outcomes for the baseline scenario and the scenario with weak parental synergy (σ = 0.05).


# Issues

If you have any questions about the code or need any help when running the code, please contact us. And if you would like to contribute to this project, please also let us know.

# Citation

If you are going to use the code, please cite our paper.
