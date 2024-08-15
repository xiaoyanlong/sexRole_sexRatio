# Simulation code and data for the manuscript "A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles"

## Abstract 

The parental roles of males and females differ remarkably across the tree of life, and several studies suggest that parental sex roles are associated with biased sex ratios. However, there is considerable debate on the causal relationship between sex roles and sex ratios and on the relative importance of the operational sex ratio (OSR), the adult sex ratio (ASR), and the maturation sex ratio (MSR). Here we use individual-based evolutionary simulations to investigate the joint evolution of sex-specific parental behaviour and the various sex ratios in several life history scenarios. We show that typically, but not always, the sex with lower mortality or faster maturity tends to provide most of the care. The association of parental sex roles with the various sex ratios is more intricate. At equilibrium, the OSR is typically biased toward the less-caring sex, but the direction and strength of OSR biases may change considerably during evolution. When the MSR or ASR are biased, a broad spectrum of parental care patterns can evolve, although the overrepresented sex generally does most of the caring. We conclude that none of the sex ratios is a driver of parental sex roles; they rather co-evolve with care biases in a subtle manner.

## Authors
Xiaoyan Long, Tamas Székely, Jan Komdeur, Franz J. Weissing

## Corresponding authors contact
FJW: f.j.weissing@rug.nl 

## Contact for questions about the simulation code

XL: xiaoyan.long@biologie.uni-freiburg.de (temporary, postdoc email) or xiaoyan.long2@gmail.com (stable, private email) 

## Citation

Long, X., Székely, T., Komdeur, J., & Weissing, F. J. (2024). A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles. <em>American Naturalist.</em>

## Funding Sources
FJW and XL were funded by the European Research Council (ERC Advanced Grant No. 789240). TS was funded by The Royal Society (Wolfson Merit Award WM170050, APEX APX\R1\191045), the National Research, Development and Innovation Office of Hungary (ÉLVONAL KKP-126949), and by Hungarian Research Network (HUN-REN Debrecen University Reproductive Strategies Research Group, 1102207). JK was funded by the Dutch Research Council (ALW-NWO Grant No. ALWOP.531) and also, together with FJW were funded bythe Dutch Research Council (NWO TOP Grant No. 854.11.003).


---


We built an individual-based evolutionary simulation to study the coevolution of sex parental roles and sex ratios based on Long and Weissing (2023). The `c++` folder contains all C++ codes which are used for simulations. All simulation data are analyzed in R (version 4.3.1). The R-script for data analysis can be found in the `Long et al.R` folder. 

## Individual-based simulations 
Please check https://github.com/xiaoyanlong/evo_sex_role for more details.

## Parameters

Simulation parameters can be changed in `param.json` (in the folder of `c++`).

We offered one example parameter setting where males have higher caring mortality than females (see Fig. 3 in the paper). You can use this code script to produce your own simulation data with the parameters you are interested in.


The example runs in roughly 20 minutes (20 simulations in total) in High-performance computing (HPC) clusters. --time must be long enough for the simulations to finish. To be sure, oversubscribe your estimated runtime.

## Outputs

Two important CSV files will be produced: 

1. `all_traits`: Average values of female care, male care, ASR, OSR, and population size at each state (pre-mating state, mating state, caring state, juvenile state).

2. `offspring`:  Individual genetic information of all parents and their offspring.


# Issues

If you have any questions about the code or need any help when running the code, please contact us. And if you would like to contribute to this project, please also let us know.

# Citation

If you are going to use the code, please cite this paper or Long and Weissing (2023).

# Reference

Long, X., Weissing, F.J. Transient polymorphisms in parental care strategies drive divergence of sex roles. Nat Commun 14, 6805 (2023). https://doi.org/10.1038/s41467-023-42607-6






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

Long, X., Weissing, F.J. Transient polymorphisms in parental care strategies drive divergence of sex roles. _Nat Commun_ 14, 6805 (2023). https://doi.org/10.1038/s41467-023-42607-6
