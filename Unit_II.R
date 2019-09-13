# library pacman 
library(pacman)
pacman::p_load(raster, sf, maptools, rgdal, ggplot2, tidyverse, broom)

nombre <- LETTERS[1:10]
longitud <- c(-116.7, -120.4, -116.7, -113.5, -115.5,
              -120.8, -119.5, -113.7, -113.7, -110.7)
latitud <- c(45.3, 42.6, 38.9, 42.1, 35.7, 38.9,
             36.2, 39, 41.6, 36.9)
est_climatic<- cbind(longitud, latitud)

# simular datos de lluvias
set.seed(0)
precip <-round((runif(length(latitud))*10)^3)
