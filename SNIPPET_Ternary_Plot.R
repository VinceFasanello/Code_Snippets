require(ggplot2)
require(ggtern)
# NOTE: ternary plots are appropriate when you have three axis for a point such that the sum of the values on each axis is 1. e.g., composition of a variable made of three components in different proportions

# useful links:
# https://youtu.be/fMWjoM9w9t4?t=175
# https://csmgeo.csm.jmu.edu/geollab/Fichter/SedRx/readternary.html
# http://www.ggtern.com/posts/



# Basic Plot
DATA <- data.frame(A = runif(100), B = runif(100), C = runif(100))
plot <- ggtern(data = DATA, 
               mapping = aes(x = A, y = B, z = C)) + 
  geom_point()
plot

# plot with arrows
plot <- plot + theme_showarrows()

plot + theme_zoom_center(0.5) # zoom in with numbers < 1
plot + theme_zoom_center(3) # zoom out with numbers > 1
plot + tern_limits(T=0.44, L=0.391, R= 0.421) # can also specify tern limits with max values (will pick min based on your max) -- this is very finicky. 

# plays nice with grid.draw
pdf(file = paste("0000_tern.pdf"),height = 8.5, width = 11); grid::grid.draw(x); dev.off()