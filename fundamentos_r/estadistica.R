# Statistis
install.packages("stringr")

library(ggplot2)
library(dplyr)
library(stringr)

mtcars <- read.csv("~/Documents/datascience-school/fundamentos_r/mtcars.csv",
                   header=TRUE, comment.char="#")

orange <- read.csv("~/Documents/datascience-school/fundamentos_r/orange.csv",
                   header=TRUE, comment.char="#")


# 
pairs(mtcars[,2:6])

pairs(mtcars)

#
newdata <- subset(mtcars, select=c(2,7:8,11,12))
pairs(newdata)

pairs(mtcars[,-c(1,3,4,5,6,9,10)])

eficientes <- filter(mtcars, mpg >= 30)
eficientes

merc <- mtcars %>% 
  filter(str_detect(model, "Merc"))
merc

pairs(eficientes[,2:6])

#
cor(mtcars[,2:6])

#
cor(newdata)


View(orange)




#mi
pairs(orange[,2:6])

pairs(orange[,5:10])

cor(orange[,2:6])

#
newdata <- subset(orange, select=c(5,6,10,11,12,13))
newdata

pairs(newdata)

cor(orange[,2:6], use = "complete.obs")


cor(orange[,5:10], use = "complete.obs")

sd(mtcars$mpg)
mean(mtcars$mpg)

# 

coefVar <- sd(mtcars$mpg) / mean(mtcars$mpg) * 100
coefVar

sd()


mean(orange$Creat.Ind...GDP, na.rm=TRUE) # Revuelve los nulos

pairs(mtcars)
