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
