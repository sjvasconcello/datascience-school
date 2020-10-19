install.packages("devtools")
devtools::install_github("nebulae-co/saber")

library("saber")

data("SB11_20112")

iteraciones <- 38
tamano_muestral <- 27

plot(
  mean(SB11_20112$MATEMATICAS_PUNT),
  sd(SB11_20112$MATEMATICAS_PUNT),
  pch = 20, cex =4, col = "white"
)


for (i in seq_len(iteraciones)) {
  points(
    mean(sample(SB11_20112$MATEMATICAS_PUNT,tamano_muestral)),
    sd(sample(SB11_20112$MATEMATICAS_PUNT,tamano_muestral)),
    pch= 20
  )
}

points(
  mean(SB11_20112$MATEMATICAS_PUNT),
  sd(SB11_20112$MATEMATICAS_PUNT),
  pch = 20, cex =4, col = "red"
)

# Clase 32

# Intervalos de confianza

table(SB11_20112$ECON_SN_INTERNET)

tamano_muestral <- 3000
iteraciones <- 100

poblac_A <- SB11_20112$FISICA_PUNT[SB11_20112$ECON_SN_INTERNET == 0]
media_poblacional_A <- mean(poblac_A, na.rm =TRUE)

poblac_B <- SB11_20112$FISICA_PUNT[SB11_20112$ECON_SN_INTERNET == 1]
media_poblacional_B <- mean(poblac_B, na.rm =TRUE)

# Esto no lo sabemos y lo vamos a estimar a travez de la muestra

plot(media_poblacional_A, media_poblacional_B, col=4, pch=20)
abline(0,1)

for (i in seq_len(iteraciones)) {
  muestra <- sample(seq_len(nrow(SB11_20112)), tamano_muestral)
  
  cuales_A <- seq_len(nrow(SB11_20112)) %in% muestra & SB11_20112$ECON_SN_INTERNET == 0
  muestra_A <- SB11_20112$FISICA_PUNT[cuales_A]
  
  media_muestral_A <- mean(muestra_A, na.rm = TRUE)
  t_test_A <- t.test(muestra_A)
  intervalo_A <- t_test_A$conf.int
  LI_A <- min(intervalo_A)
  LS_A <- max(intervalo_A)
  
  
  cuales_B <- seq_len(nrow(SB11_20112)) %in% muestra & SB11_20112$ECON_SN_INTERNET == 1
  muestra_B <- SB11_20112$FISICA_PUNT[cuales_B]
  
  media_muestral_B <- mean(muestra_B, na.rm = TRUE)
  t_test_B <- t.test(muestra_B)
  intervalo_B <- t_test_B$conf.int
  LI_B <- min(intervalo_B)
  LS_B <- max(intervalo_B)
  
  rect(LI_A, LI_B, LS_A, LS_B)
  
}

points(media_poblacional_A, media_poblacional_B, col = 4, pch= 20, cex = 4)


# Red neuronal

library("nnet")

tamano_muestral <- 2000

c(
  "ECON_PERSONAS_HOGAR",
  "ECON_CUARTOS",
  "ECON_SN_LAVADORA",
  "ECON_SN_NEVERA",
  "ECON_SN_HORNO",
  "ECON_SN_DVD",
  "ECON_SN_MICROHONDAS",
  "ECON_SN_AUTOMOVIL",
  "MATEMATICAS_PUNT"
) -> variables



indices_muestra <- seq_len(nrow(SB11_20112)) %in% sample(seq_len(nrow(SB11_20112)),tamano_muestral)

muestra <- subset(SB11_20112, subset = indices_muestra, select = variables)
muestra <- na.omit(muestra)
red_neuronal <- nnet(MATEMATICAS_PUNT ~ ., data = muestra, size = 10, linout = TRUE)


plot(muestra$MATEMATICAS_PUNT ~ predict(red_neuronal))
abline(0,1, lwd = 2, col=2)

# Clase 34

library("caret")
library("parallel")

rmse_fold <- function(pliegue, form, datos,  nn_size){
  pliegue_logic <- seq_len(nrow(datos)) %in% pliegue
  entrena <- subset(datos, !pliegue_logic)
  prueba <- subset(datos, pliegue_logic)
  modelo <- nnet(form, data = datos, size = nn_size, linout = TRUE, trace = FALSE)
  response_name <- setdiff(names(datos), modelo$coefnames)
  Y_pronosticado <- predict(modelo, newdata = prueba)
  rmse <- RMSE(Y_pronosticado, prueba[[response_name]])
  rmse
}

# Red neuronal

tamano_muestral <- 5000
neuronas <- 10
n_pliegues <- 10

c(
  "ECON_PERSONAS_HOGAR",
  "ECON_CUARTOS",
  "ECON_SN_LAVADORA",
  "ECON_SN_NEVERA",
  "ECON_SN_HORNO",
  "ECON_SN_DVD",
  "ECON_SN_MICROHONDAS",
  "ECON_SN_AUTOMOVIL",
  "MATEMATICAS_PUNT"
) -> variables



indices_muestra <- seq_len(nrow(SB11_20112)) %in% sample(seq_len(nrow(SB11_20112)), tamano_muestral)

muestra <- subset(SB11_20112, subset = indices_muestra, select = variables)
muestra <- na.omit(muestra)

createFolds(muestra$MATEMATICAS_PUNT, k = n_pliegues) -> pliegues

mclapply(
  pliegues,
  rmse_fold, 
  MATEMATICAS_PUNT ~., 
  muestra, 
  nn_size = neuronas, 
  mc.cores = floor(detectCores()*0.8)
) -> rmse_pliegues

rmse_pliegues <- unlist(rmse_pliegues)
mean(rmse_pliegues)

plot(rmse_pliegues, ylim = c(0,14))
abline(h = mean(rmse_pliegues), col =2, lwd =2)

# Clase 35













