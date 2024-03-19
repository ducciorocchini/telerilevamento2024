# Satellite data visualisation in R by imageRy
# https://sentinels.copernicus.eu/web/sentinel/user-guides/sentinel-2-msi/resolutions/spatial

library(terra)
library(imageRy)

# List of data avialable in imageRy
im.list()

# Importing data
b2 <- im.import("sentinel.dolomites.b2.tif")

# Plotting the data
clg <- colorRampPalette(c("black", "grey", "light grey"))(3)
plot(b2, col=clg)

clg <- colorRampPalette(c("black", "grey", "light grey"))(100)
plot(b2, col=clg)

clcyan <- colorRampPalette(c("magenta", "cyan4", "cyan"))(3)
plot(b2, col=clcyan)

clcyan <- colorRampPalette(c("magenta", "cyan4", "cyan"))(100)
plot(b2, col=clcyan)

clch <- colorRampPalette(c("magenta", "cyan4", "cyan", "chartreuse"))(100)
plot(b2, col=clch)

# importing the additional bands
b3 <- im.import("sentinel.dolomites.b3.tif")
plot(b3, col=clch)

b4 <- im.import("sentinel.dolomites.b4.tif")
plot(b4, col=clch)

b8 <- im.import("sentinel.dolomites.b8.tif")
plot(b8, col=clch)

# multiframe
par(mfrow=c(2,2))
plot(b2)
plot(b3)
plot(b4)
plot(b8)

par(mfrow=c(2,2))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

# Exercise
# plot the four bands one after the other in a single row
par(mfrow=c(1,4))
plot(b2, col=clch)
plot(b3, col=clch)
plot(b4, col=clch)
plot(b8, col=clch)

# Let's make a satellite image
stacksent <- c(b2, b3, b4, b8)
plot(stacksent) #, col=clch)

dev.off()
plot(stacksent[[4]])


plot(stacksent[[4]], col=clch)

# RGB plotting
# stacksent[[1]] = b2 = blue
# stacksent[[2]] = b3 = green
# stacksent[[3]] = b4 = red
# stacksent[[4]] = b8 = nir

# im.plotRGB(stacksent, r=3, g=2, b=1)
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)

# Exercise: make a plot with the natural colour and the false colour images one beside the other
par(mfrow=c(1,2))
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)

dev.off()
im.plotRGB(stacksent, 4, 3, 2)

par(mfrow=c(1,3))
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)
im.plotRGB(stacksent, 4, 3, 2)

dev.off()

# nir on green
im.plotRGB(stacksent, 3, 4, 2)

# nir on blue
im.plotRGB(stacksent, 3, 2, 4)

# final multiframe: Exercise: put the four images altogether
par(mfrow=c(2,2))
im.plotRGB(stacksent, 3, 2, 1) # natural colors
im.plotRGB(stacksent, 4, 2, 1) # nir on red
im.plotRGB(stacksent, 3, 4, 2) # nir on green
im.plotRGB(stacksent, 3, 2, 4) # nir on blue

# correlation of information
pairs(stacksent)
