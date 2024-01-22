# A life-history perspective on the evolutionary interplay of sex ratios and parental sex roles

**Long et al.**

email: xiaoyan.long@biologie.uni-freiburg.de

---


We built an individual-based evolutionary simulation to study the coevolution of sex parental roles and sex ratios based on Long and Weissing (2023). The `c++` folder contains all C++ codes which are used for simulations. All simulation data are analyzed in R (version 4.3.1). The R-script for data analysis can be found in the `Long et al.R` folder. 


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
