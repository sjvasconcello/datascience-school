# EDA Scatter plot mtcars

install.packages("ggplot2")
install.packages("dplyr")

library(ggplot2)
library(dplyr)

mtcars <- read.csv("~/Documents/datascience-school/fundamentos_r/mtcars.csv",
                   header=TRUE, comment.char="#")

orange <- read.csv("~/Documents/datascience-school/fundamentos_r/orange.csv",
                   header=TRUE, comment.char="#")

plot(mtcars$mpg ~ mtcars$cyl, 
     xlab="Cilindros", 
     ylab="Millaspor galon", 
     main="Relacion cilindros por galon")


plot(orange$Unemployment ~ orange$Education.invest...GDP, 
     xlab="Inversión eduación", 
     ylab="Desempleo", 
     main="Inversion v/s Desempleo")

plot(orange$GDP.PC ~ orange$Creat.Ind...GDP, 
     xlab="Aporte economia naranja", 
     ylab="PIB per capita", 
     main="Economia Naranja v/s PIB per capita")

# Histograms con Q plot
qplot(mtcars$hp, 
      geom="histogram", 
      xlab="Caballos de fuerza", 
      main="Autos segun caballos de fuerza")


ggplot(mtcars, aes(x=hp)) +
  geom_histogram() +
  labs(x = "Caballos de fuerza", 
       y = "Cantidad de autos", 
       title="Caballos de fuerza en autos seleccionados") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

ggplot(mtcars, aes(x=hp)) +
  geom_histogram(binwidth = 30) +
  labs(x = "Caballos de fuerza", 
       y = "Cantidad de autos", 
       title="Caballos de fuerza en autos seleccionados") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

ggplot() + geom_histogram(data=mtcars, 
                          aes(x=hp), 
                          fill="blue",
                          color="red",
                          binwidth = 20) +
  labs(x="Caballos de fuerza", 
       y="Cantidad de carros", 
       title="Caballos de fuerza en carros seleccionados") +
  xlim(c(80,280)) + 
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


#Histograma Orange

ggplot() + geom_histogram(data=orange, 
                          aes(x=Creat.Ind...GDP), 
                          fill="blue",
                          color="red",
                          binwidth = 1) +
  labs(x="PIB per. Capita", 
       y="Cantidad de paises", 
       title="PIB per capita en paises de latam") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

ggplot() + geom_histogram(data=orange, 
                          aes(x=Creat.Ind...GDP), 
                          fill="blue",
                          color="red",
                          binwidth = 1) +
  labs(x="Aporte economia naranja al pib (%)", 
       y="Cantidad de paises", 
       title="Contribución economia naraja al pib en paises latam") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())



#Boxplot
boxplot(mtcars$hp, 
        ylab="Caballos de fuerza",
        main="Caballos de fuerza en mtcars")
  

# Boxplot gglpot

ggplot(mtcars, aes(x=as.factor(cyl), y=hp, fill=cyl))+
  geom_boxplot(alpha=0.6)+
  labs(x="cilindros", y="Caballos de fuerza",
       title="Caballos de fuerza segun cilindros en mtcars")+
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


mtcars$am <- factor(mtcars$am, levels = c("Manual, Automatico1","Manual, Automatico2"), 
                    labels=c("Manual","Automantico"))

ggplot(mtcars, aes(x=as.factor(am), y=mpg, fill=am)) +
  geom_boxplot()+
  labs(x="Tipo de caja", y="Millas por galon",
       title="Millas por galon segun mtcars") +
  theme(legend.position = "none") +
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


economy <- mean(orange$GDP.PC)
economy

orange <- orange %>% 
  mutate(Strong_economy= ifelse(GDP.PC < economy, 
                                "Debajo del promedio", 
                                "Arriba del promedio"))
orange.summary

str(orange)
class(orange)

summary(orange)


#
ggplot(orange, aes(x=Strong_economy, y=Creat.Ind...GDP,
                   fill=Strong_economy)) +
  geom_boxplot(alpha=0.4) +
  labs(x="Tipo de pais", 
       y="Aporte economia naranja al PIB",
       title="Aporte a la economia naranja con alto y bajo PIB per capita") +
  theme(legend.position = "none") + 
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

#
ggplot(orange, aes(x=Strong_economy, y=Internet.penetration...population,
                   fill=Strong_economy)) +
  geom_boxplot(alpha=0.4) +
  labs(x="Tipo de pais", 
       y="Penetracion de internet",
       title="Penetracion de internet en paises con alto y bajo PIB per capita") +
  theme(legend.position = "none") + 
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())

ggplot(mtcars, aes(hp, mpg)) + 
  geom_point()+
  labs(x="Caballos de fuerza", y="Millas por galon",
       title="Relacion de caballos de fuerza por galon") +
  theme(legend.position = "none") + 
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


ggplot(mtcars, aes(wt, hp)) + 
  geom_point()+
  labs(x="Peso", y="Potencia",
       title="Relacion de peso y potencia") +
  theme(legend.position = "none") + 
  theme(panel.background = element_blank(), 
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank())


ggplot(mtcars, aes(hp,qsec))+
  geom_point(aes(color=am, size=cyl))+
  labs(x="Caballos de fuerza", y="Tiempo en 1/4 de milla",
       title="Caballos-velocidad segun cilindraje y tipo de caja")

ggplot(orange, aes(Internet.penetration...population,
                   Creat.Ind...GDP))+
  geom_point(aes(color=factor(Strong_economy), size=GDP.Growth..))+
  labs(x="Penetracion Internet", y="Aporte economia naranja PIB",
       title="Caballos-velocidad segun cilindraje y tipo de caja")



ggplot(orange, aes(Education.invest...GDP,
                   Unemployment))+
  geom_point(aes(color=factor(Strong_economy), size=GDP.Growth..))+
  labs(x="Penetracion Internet", y="Aporte economia naranja PIB",
       title="Caballos-velocidad segun cilindraje y tipo de caja")




