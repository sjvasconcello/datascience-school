# Vamos a jugar con

# Distribucion normal estandar -------------------------------------------------
Y <- rnorm(100)
plot(density(Y))

# Distribucion noraml de media cinco y desviacion estandar ---------------------
Y <- rnorm(100,5,3)
plot(density(Y))

# Distribucion uniforme 0,1 ----------------------------------------------------

Y <- runif(100)
plot(density(Y))


# Distribucion uniforme a = 3, b = 8 -------------------------------------------

Y <- runif(100, 3, 8)
plot(density(Y))

# Ejemplo edad y lugar ---------------------------------------------------------

data.frame(
  Edad = rnorm(50, 10, 1.2),
  Lugar = "Escuela"
) -> escuela

data.frame(
  Edad = rnorm(45, 15, 1.9),
  Lugar = "Preparatoria"
) -> preparatoria

data.frame(
  Edad = rnorm(80, 21, 2.5),
  Lugar = "Universidad"
) -> universidad

rbind(escuela, preparatoria, universidad) -> edad_lugar

boxplot(Edad ~ Lugar, data = edad_lugar)

# Modelo lineal
X <- seq(0,3*pi, length.out = 100)
Y <- -0.3*X + 1 + rnorm(100,0.5)
Z <- -0.3*X + 1
data.frame(X,Y,Z) -> datos_lineales

plot(Y~X, data = datos_lineales)
lines(Z~X, data = datos_lineales, col=2, lwd=2)

# Modelo no lineal
X <- seq(0,3*pi, length.out = 100)
Y <- cos(X) + rnorm(100,0.5)
Z <- cos(X)
data.frame(X,Y,Z) -> datos_no_lineales

plot(Y~X, data = datos_no_lineales)
lines(Z~X, data = datos_no_lineales, col=2, lwd=2)


