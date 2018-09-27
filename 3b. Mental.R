# Instalación de paquetes:
install.packages("vcdExtra")

# Carga de las librerías:
library(vcdExtra)

# Cargar base de datos:
data("Mental")

#Ver la base y sus dimensiones
str(Mental)
dim (Mental)
summary(Mental)

#Tabla de frecuencias Estado de salud mental vs Estado socioeconómico de los padres
Salud_Mental <- xtabs(Freq ~ ses+mental, data=Mental) 
Salud_Mental

#Tenemos una tabla de contingencia 6 x 4. 
#6 niveles socioeconòmicos (ses)= 1:6 
#4 estados mentales (mental): Well, Mild, Moderate e Impared

### ASOCIACIÓN

bb<-chisq.test(Salud_Mental)
bb

#H0 : El estado socioeconómico de los padres y la Salud Mental son independientes 
#Ha : El estado socioeconómico de los padres esta asociado a la Salud Mental
#Con un p-value significativo rechazamos la hipotesis nula y aceptamos que hay asociación


###3b. ¿Existe una asociación creciente entre este estado de salud mental y el estado socioeconómico de los padres? Justifique su respuesta.
###Teniendo en cuenta que las dos variables son ordinales. 
###Se realizará la Prueba Gamma, para poder observar la dirección de la asociación entre las variables.

GKgamma(table(Mental$ses, Mental$mental))
 
###Según la prueba de Gamma la dirección de la asociación entre las variables estudiadas es positiva.



