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

nivel_precip <- 1 + precip/500
plot(est_climatic, cex=nivel_precip, pch=20, col='blue', main='Precitación por estaciones')
# adicionar etiquetas de estaciones
text(est_climatic, nombre, pos=4)
# adicionar leyenda
breaks <- c(100, 250, 500, 1000)
legend.psize <- 1+breaks/500
legend("topright", legend=breaks, pch=20, pt.cex=legend.psize, col='blue', bg='gray')

# podemos adicionar puntos, lineas y polígonos al plot
longitud <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
latitud <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
x <- cbind(longitud, latitud)
plot(est_climatic, main='Precipitación por estaciones')
polygon(x, col='blue', border='light blue')
lines(est_climatic, lwd=3, col='red')
points(x, cex=2, pch=20)
points(est_climatic, cex=nivel_precip, pch=20, col='red', main='Precipitation by station')

