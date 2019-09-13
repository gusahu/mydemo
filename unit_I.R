#Package to install
install.packages(c("raster", "sf", "spData", "rgdal", "maptools", "ggplot2",
                   "tidyverse", "shiny", "linemap", "gapminder", "opencage",
                   "pacman"))

devtools::install_github("Nowosad/spDataLarge")
install.packages("bookdown")
rmarkdown::pandoc_version()
tinytex::install_tinytex()
system("pdflatex --version")

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


# podemos crear un esqueleto de una base de datos raster
rast <- raster(ncol=10, nrow=10, xmx=-80, xmn=-150, ymn=20, ymx=60)
rast
# asignar valores a objetos tipo raster
values(rast) <- runif(ncell(rast))
rast
# podemos asignar el número de celdas 
values(rast) <- 1:ncell(rast)
rast
# plottear objeto tipo raster
plot(rast)
# adicionar puntos y poligonos
longitud <- c(-116.8, -114.2, -112.9, -111.9, -114.2, -115.4, -117.7)
latitud <- c(41.3, 42.9, 42.4, 39.8, 37.6, 38.3, 37.6)
lonlat <- cbind(longitud, latitud)
pols <- spPolygons(lonlat, crs='+proj=longlat +datum=WGS84')
points(lonlat, col='red', pch=20, cex=3)
plot(pols, border='blue', lwd=2, add=TRUE)

##Unit 2: organization and manipulation of spatial objects##
#Import a shapefile

# Determinar el directorio de trabajo-CAMBIAR A SU CARPETA!! 
# En Windows sería algo a esto setwd("C:/Users/gusahu/Google Drive/Workshop_socher/unit_2")
setwd("/Users/gusahu/Google Drive/Workshop_socher/unit_2/division_comunal")

ch2 <- readOGR(dsn = "/Users/gusahu/Google Drive/Workshop_socher/unit_2/ch_continental",
               layer = "ch_continental")
ch2_tidy <- tidy(ch2)

#preguntar la clase del objeto espacial
class(ch) # Esta es una simple caracteristica de "sf"

summary(ch2) 

ggplot(ch2_tidy, aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", size = 0.1, fill = "lightgrey") +
  coord_equal() +
  theme_minimal()


ggplot(ch2_tidy)



