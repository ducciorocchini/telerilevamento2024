# quantifying land cover variability

# install.packages("ggplot2")

library(ggplot2)
library(terra)
library(imageRy)

# Listing images
im.list()

# Importing data
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
sunc <- im.classify(sun, num_clusters=3)

# Mato Grosso images
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# Classifying images
m1992c <- im.classify(m1992, num_clusters=2)

# class 1 = forest
# class 2 = human

m2006c <- im.classify(m2006, num_clusters=2)

# class 1 = forest
# class 2 = human


