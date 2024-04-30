# Measuring variability from satellite imagery

library(imageRy)
library(terra)
# install.packages("viridis")
library(viridis)

im.list()

sent <- im.import("sentinel.png")

im.plotRGB(sent, 1, 2, 3)

# NIR = band 1
# red = band 2
# green = band 3

im.plotRGB(sent, r=2, g=1, b=3)

nir <- sent[[1]]
cl <- colorRampPalette(c("red","orange","yellow"))(100)
plot(nir, col=cl)

sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

viridisc <- colorRampPalette(viridis(7))(256)
plot(sd3, col=viridisc)

# Standard deviation 7x7
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
plot(sd7, col=viridisc)

# stack
stacksd <- c(sd3, sd7)
plot(stacksd, col=viridisc)

# Standard deviation 13x13
sd13 <- focal(nir, matrix(1/169, 13, 13), fun=sd)

stacksd <- c(sd3, sd7, sd13)
plot(stacksd, col=viridisc)

