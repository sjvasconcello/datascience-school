4 + 8

20-8

4^2

x <- 86
x

str(mtcars)

class(mtcars$vs)


mtcars$vs = as.logical(mtcars$vs)
mtcars$am = as.logical(mtcars$am)

summary(orange)

wt <- (mtcars$wt*1000)/2
wt

mtcars.new <- transform(mtcars, wt = wt*1000/2)

tiempo_platzi <- c(25,5,10,15,10)
tiempo_lecturas <- c(30,10,5,10,15)

tiempo_aprendizaje <- tiempo_platzi + tiempo_lecturas

tiempo_aprendizaje

dias_aprendizaje <- c("Lunes","Martes","Miercoles","Jueves","Viernes")
dias_aprendizaje

dias_mas_20min <- c(TRUE, FALSE, FALSE, TRUE, TRUE)
dias_mas_20min


total_tiempo_platzi <- sum(tiempo_platzi)
total_tiempo_platzi
   
#Matriz

tiempo_matrix <- matrix(c(tiempo_platzi, tiempo_lecturas), nrow=2, byrow = TRUE)
tiempo_matrix

dias <- c("Lunes","Martes","Miercoles","Jueves","Viernes")
tiempo <- c("Tiempo platzi", "Tiempo lectura")

colnames(tiempo_matrix) <- dias
rownames(tiempo_matrix) <- tiempo
tiempo_matrix

