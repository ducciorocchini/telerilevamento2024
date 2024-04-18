# How to import external data in R

library(terra)
library(imageRy)

setwd("/home/duccio/Downloads") 
# make use of slash instead of backslash
# Example: C://Documents/ instead of C:\\Documents\ 

# read the data
eclissi <- rast("eclissi.png") 
# like i.import in imageRy
# rast() is a function in the terra package
eclissi

# plot the data
im.plotRGB(eclissi, 1, 2, 3)
im.plotRGB(eclissi, 2, 1, 3)
im.plotRGB(eclissi, 3, 1, 2)

# different methods of plotting
par(mfrow=c(1,2))
im.plotRGB(eclissi, 2, 1, 3)
plotRGB(eclissi, 3, 1, 3)

# band differencing
dif = eclissi[[1]] - eclissi[[2]]

# import another image
# Exercise: import another image from the net!
cratere <- rast("cratere")
im.plotRGB(cratere, 1, 2, 3)
im.plotRGB(cratere, 2, 1, 3)



