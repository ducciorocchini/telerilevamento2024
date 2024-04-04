# spectral indices

library(imageRy)
library(terra)

# list of files:
im.list()

# importing data
# https://visibleearth.nasa.gov/images/35891/deforestation-in-mato-grosso-brazil/35892l
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")

# band 1 = nir = R
# band 2 = red = G
# band 3 = green = B

im.plotRGB(m1992, 1, 2, 3)

# Exercise: put the nir ontop of the G component
im.plotRGB(m1992, 2, 1, 3)

# nir ontop of the B component
im.plotRGB(m1992, 2, 3, 1)

# importing the 2006 image
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")
# nir on the green component of RGB 
im.plotRGB(m2006, 2, 1, 3)
# nir on the blue component of RGB
im.plotRGB(m2006, 2, 3, 1)

# multiframe
par(mfrow=c(2,3))
im.plotRGB(m1992, 1, 2, 3) # nir on R 1992
im.plotRGB(m1992, 2, 1, 3) # nir on G 1992
im.plotRGB(m1992, 2, 3, 1) # nir on B 1992
im.plotRGB(m2006, 1, 2, 3) # nir on R 2006
im.plotRGB(m2006, 2, 1, 3) # nir on G 2006
im.plotRGB(m2006, 2, 3, 1) # nir on B 2006

#---

# Calculating the DVI (Difference Vegetation Index)
dvi1992 = m1992[[1]] - m1992[[2]] 
# alternative way of coding:
# dvi1992 = m1992$matogrosso~2219_lrg_1 - m1992$matogrosso~2219_lrg_2

# plotting the DVI
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)
plot(dvi1992, col=cl)

# 2006
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# dvi 2006
dvi2006 = m2006[[1]] - m2006[[2]] 
plot(dvi2006, col=cl)

# Exercise: plot the dvi1992 beside the dvi2006
par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)

stackdvi <- c(dvi1992, dvi2006)
pairs(stackdvi)

# Normalized Difference Vegetation Index
ndvi1992 = dvi1992 / (m1992[[1]]+m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]]+m2006[[2]])

dev.off()
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)



