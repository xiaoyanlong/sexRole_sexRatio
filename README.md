# Simulation code and data for the manuscript "A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles"

## General information 

**Authors**: Xiaoyan Long, Tamas Székely, Jan Komdeur, Franz J. Weissing

**Corresponding author contact**: f.j.weissing@rug.nl 

**Contact for questions about the simulation code**: xiaoyan.long@biologie.uni-freiburg.de (temporary, postdoc email) 

or xiaoyan.long2@gmail.com (stable, private email) 


**Citation**: Long, X., Székely, T., Komdeur, J., & Weissing, F. J. (2024). A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles. <em>American Naturalist.</em>


**Abstract**: The parental roles of males and females differ remarkably across the tree of life, and several studies suggest that parental sex roles are associated with biased sex ratios. However, there is considerable debate on the causal relationship between sex roles and sex ratios and on the relative importance of the operational sex ratio (OSR), the adult sex ratio (ASR), and the maturation sex ratio (MSR). Here we use individual-based evolutionary simulations to investigate the joint evolution of sex-specific parental behaviour and the various sex ratios in several life history scenarios. We show that typically, but not always, the sex with lower mortality or faster maturity tends to provide most of the care. The association of parental sex roles with the various sex ratios is more intricate. At equilibrium, the OSR is typically biased toward the less-caring sex, but the direction and strength of OSR biases may change considerably during evolution. When the MSR or ASR are biased, a broad spectrum of parental care patterns can evolve, although the overrepresented sex generally does most of the caring. We conclude that none of the sex ratios is a driver of parental sex roles; they rather co-evolve with care biases in a subtle manner.

**Funding Sources**: FJW and XL were funded by the European Research Council (ERC Advanced Grant No. 789240). TS was funded by The Royal Society (Wolfson Merit Award WM170050, APEX APX\R1\191045), the National Research, Development and Innovation Office of Hungary (ÉLVONAL KKP-126949), and by Hungarian Research Network (HUN-REN Debrecen University Reproductive Strategies Research Group, 1102207). JK was funded by the Dutch Research Council (ALW-NWO Grant No. ALWOP.531) and also, together with FJW were funded bythe Dutch Research Council (NWO TOP Grant No. 854.11.003).




## Layout of the repository

This repository contains the following important folders files:

`c++`: This folder contains all the C++ code used for individual-based simulations in our study.

`Simulation data`: This folder holds all the simulation data used to generate the figures in the manuscript.

`Long et al. R`: This R script is used for analyzing the simulation data, primarily for plotting figures. All simulation data were analyzed using R version 4.3.1.

`LICENSE`: This file contains the licensing information for the use and distribution of the repository's contents.


## How to run the individual-based simulations

### Windows

1. Download Visual Studio Community 2019. 

2. Open 'evorole.sln' from the folder of 'c++' directly and run the simulations in Visual Studio 2019.

It takes around 5min to run 2 simulations (time steps = 5,000,000) on the "normal" laptop (RAM: 16 GB; CPU: 4 cores, 2.1 GHz/core).

### Linux (debian/apt based)
```
> sudo apt install cmake
> sudo apt install libtbb-dev
> git clone https://github.com/xiaoyanlong/sexRole_sexRatio.git
> cd ~/sexRole_sexRatio/c++
> mkdir build & cd build
> make ..
> make install
> cd ~/sexRole_sexRatio/c++/bin
> ./c++ --help
> ./c++ param=../param.json outdir='your output directory'
```

## Parameters

Simulation parameters can be changed in `param.json` (in the folder of `c++`).

We offered one example parameter setting where males have higher caring mortality than females (see Fig. 3 in the paper). You can use this code script to produce your own simulation data with the parameters you are interested in.


## Outputs

A folder named data will be created after running the simulations. This folder will include two important CSV files:

1. `all_traits.csv`: This file contains simulation data on average values of female care, male care, ASR, OSR, and population size at each state (pre-mating state, mating state, caring state, juvenile state).

   - day: time unit
   - osr: operational sex ratio 
   - asr: adult sex ratio
   - psr: maturation sex ratio
   - preference: female preferences (always zero in our current study)
   - ornaments: male ornaments (always zero in our current study)
   - femalePC: average female care levels of the population 
   - malePC: average male care levels of the population 
   - female_care: number of females in the caring pool
   - female_mate: number of females in the mating pool
   - female_pre: number of females in the pre-mating pool (no pre-mating state in our current model)
   - female_juv: number of females in the juvenile pool
   - male_care: number of males in the caring pool
   - male_mate: number of males in the mating pool
   - male_pre: number of males in the pre-mating pool (no pre-mating state in our current model)
   - male_juv: number of males in the juvenile pool
   - pop_size: population size

2. `offspring.csv`:  This file contains the individual genetic information of all parents and their offspring.
   
   - day: time unit
   - sex: sex of the offspring
   - malep1: mating preference of the male parent, but this is only expressed in females (always zero in our current study)
   - malet: ornaments of the male parent (always zero in our current study)
   - malepc1: female care, which is not expressed in the male parent
   - malepc2: male care,  which is expressed in the male parent
   
   - femalep1: mating preference of the female parent, and this is only expressed in females (always zero in our current study)
   - female: ornaments of the female parent, but this is only expressed in males (always zero in our current study)
   - femalepc1: female care, which is only expressed in the female parent
   - femalepc2: male care,  which is not expressed in the female parent
   
   - offp1: mating preference of the offspring, and this is expressed if the offspring is a female (always zero in our current study)
   - offt: ornaments of the offspring, and this is expressed if the offspring is a male (always zero in our current study)
   - offpc1: female care of the offspring, and this is expressed if the offspring is a female
   - offpc2: male care of the offspring, and this is expressed if the offspring is a male
  
   - offjuvdays: the period that the offspring stays with its parents (the longest-care parent)
   


# Issues

If you have any questions about the code or need any help when running the code, please contact us. And if you would like to contribute to this project, please also let us know.

# license information
All code in this repository is available under a Creative Commons International 4.0 license with attribution. Authors wishing to modify this code for their own purposes should cite the version of this work archived in Zenodo.





# Simulation Code and Data for "A Life-History Perspective on the Evolutionary Interplay of Sex Ratios and Parental Sex Roles"

## General Information 

**Authors**: Xiaoyan Long, Tamas Székely, Jan Komdeur, Franz J. Weissing

**Corresponding author email**: f.j.weissing@rug.nl 

**Contact for questions about the simulation code**: 
- xiaoyan.long@biologie.uni-freiburg.de (temporary, postdoc email) 
- xiaoyan.long2@gmail.com (stable, private email)

**Citation**: Long, X., Székely, T., Komdeur, J., & Weissing, F. J. (2024). A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles. *American Naturalist.*

**Abstract**: 
The parental roles of males and females differ remarkably across the tree of life, and several studies suggest that parental sex roles are associated with biased sex ratios. However, there is considerable debate on the causal relationship between sex roles and sex ratios and on the relative importance of the operational sex ratio (OSR), the adult sex ratio (ASR), and the maturation sex ratio (MSR). Here we use individual-based evolutionary simulations to investigate the joint evolution of sex-specific parental behaviour and the various sex ratios in several life history scenarios. We show that typically, but not always, the sex with lower mortality or faster maturity tends to provide most of the care. The association of parental sex roles with the various sex ratios is more intricate. At equilibrium, the OSR is typically biased toward the less-caring sex, but the direction and strength of OSR biases may change considerably during evolution. When the MSR or ASR are biased, a broad spectrum of parental care patterns can evolve, although the overrepresented sex generally does most of the caring. We conclude that none of the sex ratios is a driver of parental sex roles; they rather co-evolve with care biases in a subtle manner.

**Funding Sources**: 
- FJW and XL were funded by the European Research Council (ERC Advanced Grant No. 789240).
- TS was funded by The Royal Society (Wolfson Merit Award WM170050, APEX APX\R1\191045), the National Research, Development and Innovation Office of Hungary (ÉLVONAL KKP-126949), and by Hungarian Research Network (HUN-REN Debrecen University Reproductive Strategies Research Group, 1102207).
- JK was funded by the Dutch Research Council (ALW-NWO Grant No. ALWOP.531) and also, together with FJW, was funded by the Dutch Research Council (NWO TOP Grant No. 854.11.003).

## Layout of the Repository

This repository contains the following key folders and files:

- **`c++`**: This folder contains all the C++ code used for individual-based simulations in our study.
- **`Simulation data`**: This folder holds all the simulation data used to generate the figures in the manuscript.
- **`Long et al. R`**: This folder contains an R script used for analyzing the simulation data, primarily for plotting figures. All simulation data were analyzed using R version 4.3.1.
- **`LICENSE`**: This file contains the licensing information for the use and distribution of the repository's contents.

## How to Run the Individual-Based Simulations

### Windows

1. Download Visual Studio Community 2019.
2. Open `evorole.sln` from the `c++` folder directly and run the simulations in Visual Studio 2019.

It takes around 5 minutes to run 2 simulations (time steps = 5,000,000) on a "normal" laptop (RAM: 16 GB; CPU: 4 cores, 2.1 GHz/core).

### Linux (Debian/apt-based)

```bash
sudo apt install cmake
sudo apt install libtbb-dev
git clone https://github.com/xiaoyanlong/sexRole_sexRatio.git
cd ~/sexRole_sexRatio/c++
mkdir build & cd build
make ..
make install
cd ~/sexRole_sexRatio/c++/bin
./c++ --help
./c++ param=../param.json outdir='your output directory'




