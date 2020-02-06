########################### Nombres d'officines selon les départements, 2019
## officine20192019 OK
data <- read.csv("officine_departement_2019.csv", header=T) ; dim(data)
data[1:10,]
library(raster)
formes <- getData(name="GADM", country="FRA", level=2)
### Index
#idx <- match(formes$NAME_2, as.character(data$departement)); idx
idx <- match(data$Nom, as.character(data$departement)); idx

#######################################################
## 3_officine2019, 9_Nzip, 

var <- paste(colnames(data)[3])
concordance <- data[idx, var]; concordance
formes$var <- concordance
couleurs <- colorRampPalette(c('white', 'green'))
#pdf(file="officine2019.pdf" ,width = 7, height = 7) 
spplot(formes, var, col.regions=couleurs(30), 
       main=list(label="Nombres d'officines selon les départements, 2019",cex=1.6))

#dev.off()
