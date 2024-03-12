# Satellite data visualisation in R by imageRy

library(terra)
library(imageRy)

# List of data avialable in imageRy
im.list()

# Importing data
mato <- im.import("matogrosso_ast_2006209_lrg.jpg")
