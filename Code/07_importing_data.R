# Importing data from external sources

library(terra)
library(imageRy)

setwd("/home/duccio/Downloads")
# make use of slash instead of backslash
# Example: C://Documents/ instead of C:\\Documents\ 

eclissi <- rast("eclissi.jpeg")

# plotting the data
im.plotRGB(eclissi, 1, 2, 3)
im.plotRGB(eclissi, 3, 2, 1)
im.plotRGB(eclissi, 2, 3, 1)
im.plotRGB(eclissi, 2, 1, 3)

# band difference
dif = eclissi[[1]] - eclissi[[2]]
plot(dif)

# import another image
ocean <- rast("oceanisgreening_2022_lrg.jpg")
im.plotRGB(ocean, 1, 2, 3)
im.plotRGB(ocean, 2, 1, 3)


