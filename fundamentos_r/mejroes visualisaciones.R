install.packages("RColorBrewer")
install.packages("rmarkdown")
install.packages("knitr")

library(ggplot2)
library(dplyr)
library(stringr)
library(RColorBrewer)
library(rmarkdown)
library(knitr)


mtcars <- read.csv("~/Documents/datascience-school/fundamentos_r/mtcars.csv",
                   header=TRUE, comment.char="#")

orange <- read.csv("~/Documents/datascience-school/fundamentos_r/orange.csv",
                   header=TRUE, comment.char="#")


#Ajustes apra mejorar visualizaciones
eficientes <- mean(mtcars$mpg)
eficientes


mtcars <- mtcars %>% 
  mutate(mas_eficientes=ifelse(mpg<eficientes, 
                               "Bajo promedio", 
                               "Sobre promedio"))

View(mtcars) 

mas_veloces <- mtcars[mtcars$qsec<16,]
mas_veloces

mtcars <- mtcars %>%
  mutate(velocidad_cuarto_milla=ifelse(qsec<16,
                                       "Menos 16 segs",
                                       "Mas de 16 segs"))

mtcars <- mtcars %>%
  mutate(peso_kilos=(wt/2)*1000)

mtcars <- mtcats %>% 
  mutate(peso=ifelse(peso_kilos<=1500,
                     "Liviano",
                     "Pesado"))

#orange economy

orange <- orange %>%
  mutate(crecimiento_GDP = ifelse(GDP.Growth.. >= 2.5, 
                                  "2.5% o mas", 
                                  "Menos de 2.5%"))

orange <- orange %>%
  mutate(anaranjado=ifelse(Creat.Ind...GDP>= 2.5,
         "Mas anaranjados",
         "Menos anaranjados"))

#ranking

orange %>%
  arrange(desc(Creat.Ind...GDP))

TopNarajas <- orange %>%
  filter(Country %in% c("Mexico","Panama","Argentina",
                        "Colombia","Brazil","Paraguay"))

TopNarajas %>%
  arrange(desc(Creat.Ind...GDP))



mas_pesados <- mtcars %>%
  filter(model %in% c("Lincoln Continental",
                      "Chrysler Imperial",
                      "Cadillac Fleetwood",
                      "Merc 450SE"))
mas_pesados

ggplot(mas_pesados, aes(x=hp, y=mpg)) +
  geom_point() +
  facet_wrap(~model)

mtcars$am <- factor(mtcars$am, levels = c("Manual","Automantico"), 
                    labels=c("Automantico","Manual"))


ggplot(mtcars, aes(x=cyl, y=mpg, size=peso)) +
  geom_point() +
  facet_wrap(~am)
  

#
ggplot(TopNarajas, aes(x=Internet.penetration...population,
                        y=Services...GDP, size=GDP.PC))+
  geom_point()+
  facet_wrap(~Country)

ggplot(TopNarajas, aes(x=Education.invest...GDP,
                       y=Creat.Ind...GDP, size=Unemployment))+
  geom_point()+
  facet_wrap(~Country)


myColors <- brewer.pal(9,"Reds")


ggplot(TopNarajas, aes(x=Internet.penetration...population,
                       y=GDP.PC, fill=Creat.Ind...GDP)) +
  geom_tile()+
  facet_wrap(~Country)+
  scale_fill_gradientn(colors=myColors)

