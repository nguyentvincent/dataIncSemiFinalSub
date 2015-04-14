rm(list = ls())
library(ggplot2)
library(gplots)
library(rgl)
library(lattice)
library(sjPlot)
library(fpc)
library(mclust)
library(cluster)
class(iris)

setwd("/Users/Vincent/Dropbox/ORIE 4740 - Final Project/PCA_Clustering/Biospecimen_Imaging_Clustering/")

ppmi.raw.data.csv = read.csv("NMIB_AverageValues.csv") #use average values
ppmi.raw.data = ppmi.raw.data.csv

#adding ratio data
t.tau.Abeta.42.ratio = ppmi.raw.data$Total.tau/ppmi.raw.data$Abeta.42
p.tau.Abeta.42.ratio = ppmi.raw.data$p.Tau181P/ppmi.raw.data$Abeta.42
p.tau.t.tau.ratio = ppmi.raw.data$p.Tau181P/ppmi.raw.data$Total.tau

ppmi.raw.data = data.frame(ppmi.raw.data,
                           t.tau.Abeta.42.ratio,
                           p.tau.Abeta.42.ratio,
                           p.tau.t.tau.ratio)

ppmi.biospecimen.imaging.data = subset.data.frame(ppmi.raw.data, select = c(
                                                                            CAUDATE_L,
                                                                            PUTAMEN_R,
                                                                            PUTAMEN_L,
                                                                            CAUDATE_ASYMMETRY,
                                                                            PUTAMEN_ASYMMETRY,
                                                                            RECRUITMENT_CAT))

ppmi.biospecimen.imaging.data$RECRUITMENT_CAT = as.factor(ppmi.biospecimen.imaging.data$RECRUITMENT_CAT)

pairs(ppmi.biospecimen.imaging.data[1:length(names(ppmi.biospecimen.imaging.data))-1],main = "PPMI",
      bg = c("red","green")[unclass(ppmi.biospecimen.imaging.data$RECRUITMENT_CAT)])


