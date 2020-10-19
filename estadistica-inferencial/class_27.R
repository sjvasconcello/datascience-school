
# Distribucion uniforma

tamano_muestral <- 70
a <- 3
b <- 8
iteraciones <- 100

X <- seq(2, 9, length.out = 100)

Y <- runif(tamano_muestral, a, b)

estimador_kernel <- density(Y)

plot(estimador_kernel)
lines(X, dunif(X,a,b), col = 2, lwd = 3)

plot(estimador_kernel)

for (i in seq_len(iteraciones)) {
  Y <- runif(tamano_muestral, a, b)
  estimador_kernel <- density(Y)
  lines(estimador_kernel)
}

lines(X, dunif(X,a,b), col = 2, lwd = 2)




# dsitribucion uniforme ---------------------------------------------------

tamano_muestral <- 70
media <- 5.5
desv_est <- 2
iteraciones <- 100

X <- seq(2, 9, length.out = 100)

Y <- rnorm(tamano_muestral, media, desv_est)

estimador_kernel <- density(Y)

plot(estimador_kernel)
lines(X, dnorm(X,media,desv_est), col = 2, lwd = 3)

plot(estimador_kernel)

for (i in seq_len(iteraciones)) {
  Y <- rnorm(tamano_muestral, media, desv_est)
  estimador_kernel <- density(Y)
  lines(estimador_kernel)
}

lines(X, dnorm(X,media,desv_est), col = 2, lwd = 3)








