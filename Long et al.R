##========================================================================================================
#             A life-history perspective on the 
#   evolutionary interplay of sex ratios and parental sex roles
#Xiaoyan Long1,2, Tamas Székely3,4, Jan Komdeur1, Franz J. Weissing1*
#
##========================================================================================================
#   All of the figures in the manuscript and supplementary materials 
#   can be created with this R-script except for the life cycle (Fig.1)
#
#   Please remember to change the path which you used to store the simulation data
#
#   Written by:
#   Xiaoyan Long
#   Institute of Biology I
#   University of Freiburg
#   Freiburg im Breisgau 79104, 
#   Germany
#   
#   Date
#   18/01/2024

##========================================================================================================


###=======Fig.2a and 2c ========
###(note that Fig. 2b was generated using data from Long and Weissing (2023))

rm(list=ls())
getwd()
library (shape)  ## used for drawing curve lines
library(dplyr)     ## used for reshaping data base
library(stringr) ##using string in r
par(mfrow = c(1,3))
par(pty = "s")

###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_2/",        # directory to search within
  pattern = "all_", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)

##subset data, time<=5e6
for (i in 1: length(data)){
  data[[i]] <-data[[i]][ which(data[[i]]$day  %% 5000==0), ]
}

#######===========Fig. 2a=============
######-------------------- Draw different models in one figure
##------------------------ draw the box
par(pty="s")
plot(0,type="n",xlim=c(0,25),ylim=c(0,25), xlab="Female care", ylab="Male care")
abline (0,1, lty=3)
abline (v = 0, lty=3)
abline (h =0, lty = 3)
abline (a=20,b=-1,lty=3)

##------------------------ plot the figures
for (i in (1:9))
  lines(data[[i]]$femalePC,data[[i]]$malePC, col = '#8dd3c7',lwd=3.0)


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)



#######===========Fig. 2c=============
######-------------------- Draw different models in one figure
##------------------------ draw the box
par(pty="s")
plot(0,type="n",xlim=c(0,25),ylim=c(0,25), xlab="Female care", ylab="Male care")
abline (0,1, lty=3)
abline (v = 0, lty=3)
abline (h =0, lty = 3)
abline (a=20,b=-1,lty=3)
##------------------------ plot the figures
for (i in (10:18))
  lines(data[[i]]$femalePC,data[[i]]$malePC, col = '#8dd3c7',lwd=3.0)


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 10:10){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 10:10){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)





datafiles = list.files ( "C:\\Users\\User\\Documents\\1_PhD project\\2_PI_random mating\\4_Data\\Figure 1c",
                         pattern = "parameter_1_Parental_Care_2", full.names = T)
library (tidyverse)
library (readr)
data = map (datafiles, read_csv)

##subset data, time<=5e6
for (i in 1: length(data)){
  data[[i]] <-data[[i]][ which(data[[i]]$day %% 5000==0), ]
}
par(mfrow = c(1,2))
par(pty = "s")
plot(0,type="n",xlim=c(0,5000000),ylim=c(0,20), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5000000,1000000), labels=c("0","1000","2000","3000", "4000","5000"))
for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)




datafiles = list.files ( "C:\\Users\\User\\Documents\\1_PhD project\\2_PI_random mating\\4_Data\\Figure 1d",
                         pattern = "parameter_1_Parental_Care_2", full.names = T)
library (tidyverse)
library (readr)
data = map (datafiles, read_csv)

##subset data, time<=5e6
for (i in 1: length(data)){
  data[[i]] <-data[[i]][ which(data[[i]]$day %% 5000==0), ]
}
par(mfrow = c(1,2))
par(pty = "s")
plot(0,type="n",xlim=c(0,5000000),ylim=c(0,20), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5000000,1000000), labels=c("0","1000","2000","3000", "4000","5000"))
for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)







####################=======================================
###=======Fig.3 ========
rm(list=ls())
getwd()
library (shape)  ## used for drawing curve lines
library(dplyr)     ## used for reshaping data base
library(stringr) ##using string in r
par(mfrow = c(1,3))
par(pty = "s")

###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_3/",        # directory to search within
  pattern = "all_", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)


#######===========Fig. 3a=============
######-------------------- Draw different models in one figure
##------------------------ draw the box
par(pty="s")
plot(0,type="n",xlim=c(0,25),ylim=c(0,25), xlab="Female care", ylab="Male care")
abline (0,1, lty=3)
abline (v = 0, lty=3)
abline (h =0, lty = 3)
abline (a=20,b=-1,lty=3)

##------------------------ plot the figures
for (i in (1:8))
  lines(data[[i]]$femalePC,data[[i]]$malePC, col = '#8dd3c7',lwd=3.0)


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)



#######===========Fig. 3b=============
######-------------------- Draw different models in one figure
##------------------------ draw the box
par(pty="s")
plot(0,type="n",xlim=c(0,25),ylim=c(0,25), xlab="Female care", ylab="Male care")
abline (0,1, lty=3)
abline (v = 0, lty=3)
abline (h =0, lty = 3)
abline (a=20,b=-1,lty=3)
##------------------------ plot the figures
for (i in (9:16))
  lines(data[[i]]$femalePC,data[[i]]$malePC, col = '#8dd3c7',lwd=3.0)


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 9:9){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 9:9){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)





datafiles = list.files ( "C:\\Users\\User\\Documents\\1_PhD project\\2_PI_random mating\\4_Data\\Figure 1c",
                         pattern = "parameter_1_Parental_Care_2", full.names = T)
library (tidyverse)
library (readr)
data = map (datafiles, read_csv)

##subset data, time<=5e6
for (i in 1: length(data)){
  data[[i]] <-data[[i]][ which(data[[i]]$day %% 5000==0), ]
}
par(mfrow = c(1,2))
par(pty = "s")
plot(0,type="n",xlim=c(0,5000000),ylim=c(0,20), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5000000,1000000), labels=c("0","1000","2000","3000", "4000","5000"))
for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)




datafiles = list.files ( "C:\\Users\\User\\Documents\\1_PhD project\\2_PI_random mating\\4_Data\\Figure 1d",
                         pattern = "parameter_1_Parental_Care_2", full.names = T)
library (tidyverse)
library (readr)
data = map (datafiles, read_csv)

##subset data, time<=5e6
for (i in 1: length(data)){
  data[[i]] <-data[[i]][ which(data[[i]]$day %% 5000==0), ]
}
par(mfrow = c(1,2))
par(pty = "s")
plot(0,type="n",xlim=c(0,5000000),ylim=c(0,20), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5000000,1000000), labels=c("0","1000","2000","3000", "4000","5000"))
for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)











####################=======================================
###=======Fig.4 ========
rm(list=ls())
getwd()
library (shape)  ## used for drawing curve lines
library(dplyr)     ## used for reshaping data base
library(stringr) ##using string in r
par(mfrow = c(2,2))
par(pty = "m")

###=======Fig.4a ========
###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/2020-11-13-mate/malemate0.005/",        # directory to search within
  pattern = "all_", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)


plot(0,type="n",xlim=c(0,5e8),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 2:2){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e8),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 2:2){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)




plot(0,type="n",xlim=c(0,5e8),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 8:8){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e8),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 8:8){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)



###=======Fig.4b ========
###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/2020-11-13-mate/femalemate0.005/",        # directory to search within
  pattern = "all_", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)


plot(0,type="n",xlim=c(0,5e8),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 3:3){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e8),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 3:3){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)




plot(0,type="n",xlim=c(0,5e8),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 19:19){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e8),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e8,1e8), labels=c("0","100,000","200,000","300,000", "400,000","500,000"))

for (index in 19:19){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)







####################=======================================
###=======Fig.5============
####=======Fig. 5a===========
###====parental care======
juvU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/juvU_care.csv")
juvU <- juvU[order(juvU$udiff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
juvU$uscale <- juvU$udiff*5

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/5
}

library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p1 <- ggplot(data=juvU,aes(uscale, fremalcare)) + 
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="white") + geom_smooth(data=juvU,aes(uscale, fremalcare),method = "glm", 
                                                 method.args = list(family = "binomial"), 
                                                 se = FALSE,colour = "white")  + coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
scale_y_continuous(name ="Percentage of simulations resulting in male-biased care",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p1



###=====ASR======

juvU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/juvU_care.csv")
juvU <- juvU[order(juvU$udiff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
juvU$uscale <- juvU$udiff*5

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/5
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=juvU,aes(uscale, asr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#0CAF3E") + geom_smooth(data=juvU,aes(uscale, asr),method = "glm", 
                                                 method.args = list(family = "binomial"), 
                                                 se = FALSE,colour = "#0CAF3E")  + coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Percentage of simulations resulting in male-biased care",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))


p2



###=====OSR======

juvU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/juvU_care.csv")
juvU <- juvU[order(juvU$udiff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
juvU$uscale <- juvU$udiff*5

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/5
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=juvU,aes(uscale, osr,colour=factor(group))) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#EFE459")+
  geom_smooth(data=juvU,aes(uscale, osr,colour=factor(group)),method = "glm", 
              method.args = list(family = "binomial"), se=F)+coord_equal()+
  scale_color_manual(values=c("#EFE459", "#EFE459"))+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Percentage of simulations resulting in male-biased care",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p3






####=======Fig. 5b===========
###====parental care======
careU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/careU-care.csv")
careU <- careU[order(careU$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
careU$uscale <- careU$diff*1e3

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/1e3
}

library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p1 <- ggplot(data=careU,aes(uscale, fremalcare)) + 
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="white") + geom_smooth(data=careU,aes(uscale, fremalcare),method = "glm", 
                                                 method.args = list(family = "binomial"), 
                                                 se = FALSE,colour = "white")  + coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Percentage of simulations resulting in male-biased care",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p1



###=====ASR======

careU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/careU-care.csv")
careU <- careU[order(careU$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
careU$uscale <- careU$diff*1e3

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/1e3
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=careU,aes(uscale, asr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#0CAF3E") + geom_smooth(data=careU,aes(uscale, asr),method = "glm", 
                                                   method.args = list(family = "binomial"), 
                                                   se = FALSE,colour = "#0CAF3E")  + coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                        size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))


p2



###=====OSR======

careU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/careU-care.csv")
careU <- careU[order(careU$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
careU$uscale <- careU$diff*1e3

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/1e3
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=careU,aes(uscale, osr,colour=factor(group))) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#EFE459")+
  geom_smooth(data=careU,aes(uscale, osr,colour=factor(group)),method = "glm", 
              method.args = list(family = "binomial"), se=F)+coord_equal()+
  scale_color_manual(values=c("#EFE459", "#EFE459"))+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="OSR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p3








####=======Fig. 5c===========
###====parental care======
mateU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/mateU_care.csv")
mateU <- mateU[order(mateU$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
mateU$uscale <- mateU$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p1 <- ggplot(data=mateU,aes(uscale, fremalcare)) + 
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=1.5,color="white") + geom_smooth(data=mateU,aes(uscale, fremalcare),method = "glm", 
                                                   method.args = list(family = "binomial"), 
                                                   se = FALSE,colour = "white")  + coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Percentage of simulations resulting in male-biased care",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p1


###=====ASR======

mateU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/mateU_care.csv")
mateU <- mateU[order(mateU$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
mateU$uscale <- mateU$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=mateU,aes(uscale, asr,colour=factor(group))) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#0CAF3E")+
  geom_smooth(data=mateU,aes(uscale, asr,colour=factor(group)), se=F)+coord_equal()+
  scale_color_manual(values=c("#0CAF3E", "#0CAF3E"))+
  
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                        size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))


p2



###=====OSR======

mateU <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_5/mateU_care.csv")
mateU <- mateU[order(mateU$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
mateU$uscale <- mateU$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=mateU,aes(uscale, osr,colour=factor(group))) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#EFE459")+
  geom_smooth(data=mateU,aes(uscale, osr,colour=factor(group)),method = "glm", 
              method.args = list(family = "binomial"), se=F)+coord_equal()+
  scale_color_manual(values=c("#EFE459", "#EFE459"))+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="OSR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p3








####################=======================================
####=======Fig. 6===========
####=======Fig. 6a===========
###====parental care======
juvU_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesynjuv.csv")
juvU_syn <- juvU_syn[order(juvU_syn$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
juvU_syn$uscale <- juvU_syn$diff*5

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/5
}

p1 <- ggplot(data=juvU_syn,aes(x=uscale)) + geom_point(aes(y=femcare),size=0.8,colour="#ef8961")+
  geom_smooth(aes(y=femcare),se=F,colour="#ef8961")+
  geom_point(aes(y=malcare),size=0.8,colour="#67a9cf")+
  geom_smooth(aes(y=malcare),se=F,colour="#67a9cf")+
  coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white ", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_vline(xintercept=0.0, linetype="dashed")+
scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Parental care",breaks = scales::pretty_breaks(n = 5),limits=c(0,25))

p1

###=====ASR======

juvU_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesynjuv.csv")
juvU_syn <- juvU_syn[order(juvU_syn$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
juvU_syn$uscale <- juvU_syn$diff*5

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/5
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=juvU_syn,aes(uscale, asr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#0CAF3E")+
  geom_smooth(data=juvU_syn,aes(uscale, asr, se=F),colour ="#0CAF3E")+coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                        size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))


p2



###=====OSR======

juvU_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesynjuv.csv")
juvU_syn <- juvU_syn[order(juvU_syn$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
juvU_syn$uscale <- juvU_syn$diff*5

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/5
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=juvU_syn,aes(uscale, osr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#EFE459")+
  geom_smooth(data=juvU_syn,aes(uscale, osr), se=F,colour="#EFE459")+coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="OSR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p3










####=======Fig. 6b===========
###====parental care======
care_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesyncare.csv")
care_syn <- care_syn[order(care_syn$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
care_syn$uscale <- care_syn$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

p1 <- ggplot(data=care_syn,aes(x=uscale)) + geom_point(aes(y=femcare),size=0.8,colour="#ef8961")+
  geom_line(aes(y=femcare),colour="#ef8961")+
  geom_point(aes(y=malcare),size=0.8,colour="#67a9cf")+
  geom_line(aes(y=malcare),colour="#67a9cf")+
  coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white ", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Parental care",breaks = scales::pretty_breaks(n = 5),limits=c(0,25))

p1

###=====ASR======

care_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesyncare.csv")
care_syn <- care_syn[order(care_syn$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
care_syn$uscale <- care_syn$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=care_syn,aes(uscale, asr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#0CAF3E")+
  geom_line(data=care_syn,aes(uscale, asr),colour ="#0CAF3E",size=1.5)+
  coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                        size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))


p2





###=====OSR======

care_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesyncare.csv")
care_syn <- care_syn[order(care_syn$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
care_syn$uscale <- care_syn$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=care_syn,aes(uscale, osr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#EFE459")+
  geom_line(data=care_syn,aes(uscale, osr), colour="#EFE459")+coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="OSR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p3










####=======Fig. 6c===========
###====parental care======
mate_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesynmate.csv")
mate_syn <- mate_syn[order(mate_syn$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
mate_syn$uscale <- mate_syn$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

p1 <- ggplot(data=mate_syn,aes(x=uscale)) + geom_point(aes(y=femcare),size=0.8,colour="#ef8961")+
  geom_line(aes(y=femcare),colour="#ef8961")+
  geom_point(aes(y=malcare),size=0.8,colour="#67a9cf")+
  geom_line(aes(y=malcare),colour="#67a9cf")+
  coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white ", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="Parental care",breaks = scales::pretty_breaks(n = 5),limits=c(0,25))

p1



###=====ASR======

mate_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesynmate.csv")
mate_syn <- mate_syn[order(mate_syn$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
mate_syn$uscale <- mate_syn$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=mate_syn,aes(uscale, asr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#0CAF3E")+
  geom_smooth(data=mate_syn,aes(uscale, asr),se=F,colour ="#0CAF3E",size=1.5)+
  coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                        size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))


p2





###=====OSR======

mate_syn <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_6/largesynmate.csv")
mate_syn <- mate_syn[order(mate_syn$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#for changing the width of the figure
mate_syn$uscale <- mate_syn$diff*50

# label with original values of x
# noth that x-axis is the difference in mortality rates between the sexes
labels <- function(x) {
  x/50
}

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=mate_syn,aes(uscale, osr)) +
  annotation_custom(myGrob, xmin=-0.8, xmax=0.8, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-0.8, xmax=0.8, ymin=0.5, ymax=1.2 )+
  geom_point(size=2,color="#EFE459")+
  geom_line(data=mate_syn,aes(uscale, osr), colour="#EFE459")+coord_equal()+
  theme(legend.position = "none")+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Mortality rates",breaks = scales::pretty_breaks(n = 2),limits=c(-0.5,0.5),label=labels)+
  scale_y_continuous(name ="OSR",breaks = scales::pretty_breaks(n = 2),limits=c(0.0,1.0))

p3










####################=======================================
####=======Fig.S1===========
####=======Fig.S1a===========
###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S1/juvT_female5_male30/",        # directory to search within
  pattern = "all", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##average
##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)  # read all the matching files

data1 <- vector(mode="list", length=length(data))
for (i in 1: length(data)){
  data1[[i]] <-data[[i]][ which(data[[i]]$day %% 5e4==0), ]
}




plot(0,type="n",xlim=c(0,5e7),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))
for (index in 2:2){
  lines(data1[[index]] $day, data1[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data1[[index]] $day, data1[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e7),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))

for (index in 2:2){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)

plot(0,type="n",xlim=c(0,5e7),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))
for (index in 1:1){
  lines(data1[[index]] $day, data1[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data1[[index]] $day, data1[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e7),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)

####=======Fig.S1b===========
###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S1/juvT_female30_male5/",        # directory to search within
  pattern = "all", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##average
##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)  # read all the matching files

data1 <- vector(mode="list", length=length(data))
for (i in 1: length(data)){
  data1[[i]] <-data[[i]][ which(data[[i]]$day %% 5e4==0), ]
}


plot(0,type="n",xlim=c(0,5e7),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))
for (index in 1:1){
  lines(data1[[index]] $day, data1[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data1[[index]] $day, data1[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e7),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)



plot(0,type="n",xlim=c(0,5e7),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))
for (index in 2:2){
  lines(data1[[index]] $day, data1[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data1[[index]] $day, data1[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}


plot(0,type="n",xlim=c(0,5e7),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e7,1e7), labels=c("0","10,000","20,000","30,000", "40,000","50,000"))

for (index in 2:2){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)

####################=======================================
####=======Fig. S2===========
####=======Fig. S2a==========
###====parental care======
juvT <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S2/juvT.csv")
juvT <- juvT[order(juvT$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)
library(grid)

myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p1 <- ggplot(data=juvT,aes(diff, fremalcare)) + 
  annotation_custom(myGrob, xmin=-55, xmax=55, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-55, xmax=55, ymin=0.5, ymax=1.2 )+
  geom_point(size=1.5,color="white") + geom_smooth(data=juvT,aes(diff, fremalcare),method = "glm", 
                                                   method.args = list(family = "binomial"), 
                                                   se = FALSE,colour = "white")  + coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect( colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_hline(yintercept=0.5, linetype="dashed")+geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Maturation time",breaks = scales::pretty_breaks(n = 5),limits=c(-45,45))+
  scale_y_continuous(name ="Percentage of simulations resulting in male-biased care",breaks = scales::pretty_breaks(n = 5),limits=c(0.0,1.0))

p1



###=====ASR======

juvT <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S2/juvT.csv")
juvT <- juvT[order(juvT$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

p2 <- ggplot(data=juvT,aes(diff, asr)) + geom_point(size=1.5,colour="#0CAF3E")+
  annotation_custom(myGrob, xmin=-55, xmax=55, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-55, xmax=55, ymin=0.5, ymax=1.2 )+
  geom_smooth(data=juvT,aes(diff, asr),se=F,colour="#0CAF3E")+coord_equal()+
  # geom_smooth(data=juvT,aes(diff, asr),method = "glm",
  #             method.args = list(family = "binomial"),
  #             se = FALSE)  + coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_hline(yintercept=0.5, linetype="dashed")+
  geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Maturation time",breaks = scales::pretty_breaks(n = 5),limits=c(-45,45))+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 5),limits=c(0.0,1.0))
p2




###=====OSR======


juvT <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S2/juvT.csv")
juvT <- juvT[order(juvT$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))



p3 <- ggplot(data=juvT,aes(diff, osr,colour=factor(group))) + 
  annotation_custom(myGrob, xmin=-55, xmax=55, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-55, xmax=55, ymin=0.5, ymax=1.2 )+
  geom_point(size=1.5,color="#EFE459")+
  geom_smooth(data=juvT,aes(diff, osr,colour=factor(group)),method = "glm", 
              method.args = list(family = "binomial"), 
              se = FALSE)  + coord_equal()+
  # geom_smooth(data=smallsyncare,aes(diff, osr,colour=factor(group1)),method = "glm", 
  #             method.args = list(family = "binomial"), 
  #             se = FALSE)  + coord_equal()+
  scale_color_manual(values=c("#EFE459", "#EFE459"))+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_hline(yintercept=0.5, linetype="dashed")+
  geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Maturation time",breaks = scales::pretty_breaks(n = 5),limits=c(-45,45))+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 5),limits=c(0.0,1.0))

p3












####=======Fig. S2b==========
###====parental care======
juvT <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S2/synjuvT.csv")
juvT <- juvT[order(juvT$diff),]

library(ggplot2)
library(scatterpie)
library(tidyr)

p1 <- ggplot(data=juvT,aes(x=diff)) + geom_point(aes(y=femcare),size=1.2,colour="#ef8961")+
  #geom_line(aes(y=femcare),colour="#ef8961")+
  geom_smooth(data=juvT,aes(diff, femcare),
              se = FALSE,colour="#ef8961")  + coord_equal()+
  geom_point(aes(y=malcare),size=1.2,colour="#67a9cf")+
  #geom_line(aes(y=malcare),colour="#67a9cf")+
  geom_smooth(data=juvT,aes(diff, malcare),
              se = FALSE,colour="#67a9cf")  + coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white ", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_vline(xintercept=0.0, linetype="dashed")+
  scale_x_continuous(name ="Maturation time",breaks = scales::pretty_breaks(n = 5),limits=c(-2500,2500))+
  scale_y_continuous(name ="Parental care",breaks = scales::pretty_breaks(n = 5),limits=c(0,20))

p1



###=====ASR======

juvT <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S2/synjuvT.csv")
juvT <- juvT[order(juvT$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))




p2 <- ggplot(data=juvT,aes(diff, asr)) + 
  annotation_custom(myGrob, xmin=-2800, xmax=2800, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-2800, xmax=2800, ymin=0.5, ymax=1.2 )+
  geom_point(size=1.2,colour="#0CAF3E")+
  #geom_line(data=juvT,aes(diff, asr),colour="white",size=1)+coord_equal()+
  geom_smooth(data=juvT,aes(diff, asr),method = "glm",
              method.args = list(family = "binomial"),
              se = FALSE,colour="#0CAF3E")  + coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_vline(xintercept=0.0, linetype="dashed")+
  geom_hline(yintercept=0.5, linetype="dashed")+
  scale_x_continuous(name ="Maturation time",breaks = scales::pretty_breaks(n = 5),limits=c(-2500,2500))+
  scale_y_continuous(name ="ASR",breaks = scales::pretty_breaks(n = 5),limits=c(0,1))

p2



###=====OSR======


juvT <- read.csv(file="/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S2/synjuvT.csv")
juvT <- juvT[order(juvT$diff),]


library(ggplot2)
library(scatterpie)
library(tidyr)

#backgroud color
library(grid)
myGrob <- grobTree(rectGrob(gp=gpar(fill="#ef8961", alpha=0.5)),
                   gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))

myGrob2 <- grobTree(rectGrob(gp=gpar(fill="#68A9CF", alpha=0.5)),
                    gTree(x0=0, x1=1, y0=0, y1=1, default.units="npc"))


p3 <- ggplot(data=juvT,aes(diff, osr)) + 
  annotation_custom(myGrob, xmin=-2800, xmax=2800, ymin=-0.2, ymax=0.5 ) +
  annotation_custom(myGrob2, xmin=-2800, xmax=2800, ymin=0.5, ymax=1.2 )+
  geom_point(size=1.2,colour="#EFE459")+
  #geom_line(data=juvT,aes(diff, osr),colour="white",size=1)+coord_equal()+
  geom_smooth(data=juvT,aes(diff, osr),
              se = FALSE,colour="#EFE459")  + coord_equal()+
  theme(legend.position = "none")+theme(aspect.ratio=1)+
  theme(panel.grid.major.x = element_blank(), panel.grid.major.y = element_blank(),
        panel.grid.minor.x = element_blank(),panel.grid.minor.y = element_blank(),
        legend.title = element_blank(),panel.background = element_rect(fill = "white", colour = "black",
                                                                       size = 0.5, linetype = "solid"))+
  theme(axis.text.x = element_text(color = "black", size = 5, angle = 0, hjust = .5, vjust = .5, face = "plain"),
        axis.text.y = element_text(color = "black", size = 5, angle = 90, hjust = .5, vjust = .5, face = "plain"))+
  geom_vline(xintercept=0.0, linetype="dashed")+
  geom_hline(yintercept=0.5, linetype="dashed")+
  scale_x_continuous(name ="Maturation time",breaks = scales::pretty_breaks(n = 5),limits=c(-2500,2500))+
  scale_y_continuous(name ="osr",breaks = scales::pretty_breaks(n = 5),limits=c(0,1))

p3











####################=======================================
######==========Fig_S5============

rm(list=ls())
getwd()
library (shape)  ## used for drawing curve lines
library(dplyr)     ## used for reshaping data base
library(stringr) ##using string in r
par(mfrow = c(1,2))
par(pty = "s")

###read data in different pathes
files_to_read = list.files(
  path = "/Users/xiaoyanlong/Documents/PhD /3_PI_sex ratio/1_data/for figures/Fig_S3/femjuv0.01_malejuv0.001_malecare0.002_femalecare0.001/",        # directory to search within
  pattern = "all_", # regex pattern, some explanation below
  recursive = TRUE,          # search subdirectories
  full.names = TRUE          # return the full path
)

##reorder the path according to normal order
library(gtools)
files_to_read <- mixedsort(files_to_read)
data = lapply(files_to_read, read.csv)


par(mfrow = c(2,2))
par(pty = "s")


##subset data, time<=5e6
for (i in 1: length(data)){
  data[[i]] <-data[[i]][ which(data[[i]]$day  %% 5000==0), ]
}
plot(0,type="n",xlim=c(0,5e6),ylim=c(0,25), xlab="Generation", ylab="Parental care",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ malePC, col="#67a9cf", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ femalePC,col="#ef8961", lwd=2.5)
}



plot(0,type="n",xlim=c(0,5e6),ylim=c(0,1), xlab="Generation", ylab="Sex ratio",xaxt = "n")
axis(1, at=seq(0,5e6,1e6), labels=c("0","1000","2000","3000", "4000","5000"))

for (index in 1:1){
  lines(data[[index]] $day, data[[index]] $ osr, col="#F2B600", lwd=2.5)
  lines(data[[index]] $day, data[[index]] $ asr,col="#95C9A9", lwd=2.5)
}
abline(h=0.5,col="black",lty=2)



