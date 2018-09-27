# Instalaci�n de paquetes:
install.packages("vcdExtra")

# Carga de las librer�as:
library(vcdExtra)

# Cargar base de datos:
data("Mental")

#Ver la base y sus dimensiones
str(Mental)
dim (Mental)
summary(Mental)

#Tabla de frecuencias Estado de salud mental vs Estado socioecon�mico de los padres
Salud_Mental <- xtabs(Freq ~ ses+mental, data=Mental) 
Salud_Mental

#Tenemos una tabla de contingencia 6 x 4. 
#6 niveles socioecon�micos (ses)= 1:6 
#4 estados mentales (mental): Well, Mild, Moderate e Impared

### ASOCIACI�N

bb<-chisq.test(Salud_Mental)
bb

#H0 : El estado socioecon�mico de los padres y la Salud Mental son independientes 
#Ha : El estado socioecon�mico de los padres esta asociado a la Salud Mental
#Con un p-value significativo rechazamos la hipotesis nula y aceptamos que hay asociaci�n


###3b. �Existe una asociaci�n creciente entre este estado de salud mental y el estado socioecon�mico de los padres? Justifique su respuesta.
###Teniendo en cuenta que las dos variables son ordinales. 
###Se realizar� la Prueba Gamma, para poder observar la direcci�n de la asociaci�n entre las variables.

GKgamma(table(Mental$ses, Mental$mental))
 
###Seg�n la prueba de Gamma la direcci�n de la asociaci�n entre las variables estudiadas es positiva.


