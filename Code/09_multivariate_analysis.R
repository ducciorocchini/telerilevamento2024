# Multivariate analysis

library(imageRy)
library(terra)
library(viridis)
# install.packages("viridis")

# listing data
im.list()

# importing data
b2 <- im.import("sentinel.dolomites.b2.tif") # blue
b3 <- im.import("sentinel.dolomites.b3.tif") # green
b4 <- im.import("sentinel.dolomites.b4.tif") # red
b8 <- im.import("sentinel.dolomites.b8.tif") # nir

sentdo <- c(b2, b3, b4, b8)

im.plotRGB(sentdo, r=4, g=3, b=2)
im.plotRGB(sentdo, r=3, g=4, b=2)

pairs(sentdo)


