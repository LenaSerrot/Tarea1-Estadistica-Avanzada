# Instalación de paquetes:
install.packages("vcd")
install.packages("effects")
install.packages("visreg")
install.packages("arules")

# Carga de las librerías:
library(vcd)
library(effects)
library(visreg)
library(arules)

# Cargar base de datos Artritis:
data("Arthritis")

# Ver la base de datos Artritis (print) y verificar número de casos (dim):
print(Arthritis)
dim(Arthritis)


### Discretice la edad de los individuos en intervalos de longitud 17

discretize(Age, method = "interval", length = 17)
Age_disc <- discretize(Age, method = "interval", length = 17)
table(Age_disc)
table (Improved, Age_disc)

