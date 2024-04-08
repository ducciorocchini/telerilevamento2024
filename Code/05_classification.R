# quantifying land cover change

# intsall.packages("ggplot2")

library(terra)
library(imageRy)
library(ggplot2)

im.list()

# https://www.esa.int/ESA_Multimedia/Images/2020/07/Solar_Orbiter_s_first_views_of_the_Sun6
# additional images: https://webbtelescope.org/contents/media/videos/1102-Video?Tag=Nebulas&page=1

# importing images
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# classifying images
sunc <- im.classify(sun, num_clusters=3)

# importing Mato grosso images
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# classifying images
m1992c <- im.classify(m1992, num_clusters=2)

# 1992
# class 1 = human
# class 2 = forest

m2006c <- im.classify(m2006, num_clusters=2)

# 2006
# class 1 = human
# class 2 = forest


