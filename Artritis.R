install.packages(c("epiDisplay","vcd","epitools","catdata","Deducer","vcdExtra","effects","visreg","lme4","aod","car","rms","ROCR","boot","ggplot2","grDevices","mvc","ca","FactoMineR"))

library(epiDisplay)
library(vcd)
library(epitools)
library(catdata)
library(Deducer)
library(vcdExtra)
library(MASS)
library(effects)
library(visreg)
library(lme4)
library(aod)
library(car)
library(rms)
library(ROCR)
library(boot)
library(ggplot2)
library(grDevices)
library(mvc)
library(ca)
library(FactoMineR)


# Cargar base de datos Artritis:
data("Arthritis")

# Ver la base de datos Artritis (print) y verificar número de casos (dim):
print(Arthritis)
dim(Arthritis)

Artritis <- Arthritis

#Tabla de contingencia
#Tabla Tratamiento vs. Mejora

Contin <- table(Artritis$Treatment, Artritis$Improved)

### ASOCIACIÓN

#Podemos realizare la prueba ji cuadrada, dado que, para todos los casos Eij>5

Mejora<-chisq.test(Contin)

Mejora

Mejora$expected

Mejora$residuals

Mejora$stdres


### Medidas de fuerza de asociación


assocstats(Contin)

#Tabla Treatment vs Improved

Contin_mat <- matrix(c(29, 13, 7, 7, 7, 21),2,3)


dimnames(Contin_mat)<-list(c("Placebo","Treater"),c("None","Some", "Marked"))
names(dimnames(Contin_mat))<-c("Tratamiento","Mejora")


### Fisher exact. 

Contin_mat <- matrix(c(29, 13, 7, 7, 7, 21),2,3)

dimnames(Contin_mat)<-list(c("Placebo","Treater"),c("None","Some", "Marked"))
names(dimnames(Contin_mat))<-c("Tratamiento","Mejora")

fisher.test(Contin_mat,alternative="great")



