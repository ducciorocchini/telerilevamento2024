# Second method to quantify changes in time 
# The first method was based on classification

library(imageRy)
library(terra)

im.list()

# importing data
EN01 <- im.import("EN_01.png")
EN13 <- im.import("EN_13.png")

par(mfrow=c(2,1))
im.plotRGB.auto(EN01)
im.plotRGB.auto(EN13)

difEN = EN01[[1]] - EN13[[1]]
cl <- colorRampPalette(c("blue","white","red")) (100)
plot(difEN, col=cl)

## Ice melt in Greenland
g2000 <- im.import("greenland.2000.tif")
clg <- colorRampPalette(c("black","blue","white","red")) (100)
plot(g2000, col=clg)

g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

par(mfrow=c(2,2))
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)

# stack
greenland <- c(g2000, g2005, g2010, g2015)
plot(greenland, col=clg)

difg = greenland[[1]] - greenland[[4]]
clgreen <- colorRampPalette(c("red","white","blue")) (100)
plot(difg, col=clgreen)

im.plotRGB(greenland, r=1, g=2, b=4) # g2000 on red, g2005 on green, g2015 on blue

