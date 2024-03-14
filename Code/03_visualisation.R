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
plot(stacksent, col=clch)

dev.off()
plot(stacksent[[4]], col=clch)



