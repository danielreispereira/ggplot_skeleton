################################################################################
# ggplot always uses the same structure, why not keep a nice template or
# skeleton to start with a copy and paste next time?
################################################################################ 


# RESOURCES
# http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html
# 

# Load Packages
library (ggplot2)       # Needed for plotting
library (grid)          # Needed for customising plot area
library (scales)        # Needed for ediring log tickmarks
library (directlabels)

# Select Font Size
size1 = 20 # Plot and Axis Titles
size2 = 17 # Legend Title
size3 = 15 # Axis Labels


ggplot (data = mtcars, aes (x= disp, y= drat)) +
  
  geom_point ( aes(colour= mpg), size= 5) +
  
  scale_y_log10 (
    limits = c(0.01, 10),
    name = "Axis Title Here",
    label = trans_format('log10',math_format(10^.x)) # Format = 10^x rather than 1e10x (also use label = comma)
  ) +
  
  scale_x_log10 (
    limits = c(10, 1000),
    name = "Axis Title Here",
    label = trans_format('log10',math_format(10^.x)) # Format = 10^x rather than 1e10x (also use label = comma)
  ) +
  
  annotation_logticks ( # Turn on minor ticks
    short = unit (0.2, "cm"), # Minor tick length
    mid = unit (0.2, "cm"), # ...
    long = unit (0.2, "cm"), # ...
    side = "lbrt") + # l = left, b = bottom etc
  
  labs ( # New way of setting some attributes.
    colour = "MPG",
    title  = "Plot Title"
    x      = "x what I want"
  ) +
  
  theme (
    plot.title = element_text (vjust = 3, size = 20), # plot title attrib.
    plot.margin = unit (c(3, 3, 3, 3), "lines"), # plot margins
    panel.border = element_rect (colour = "black", fill = F, size = 1), # axis colour = black
    panel.grid.major = element_blank (), # remove major grid
    panel.grid.minor = element_blank (), # remove minor grid
    panel.background = element_rect (fill = "white"), # background colour
    legend.background = element_rect (fill = "white"), # background colour
    legend.justification=c(0, 0), # lock point for legend
    legend.position = c(0, 0), # put the legend INSIDE the plot area
    legend.key = element_blank (), # switch off the rectangle around symbols in the legend
    legend.title = element_blank (), # switch off the legend title
    legend.text = element_text (size = 15), # sets the attributes of the legend text
    axis.title.x = element_text (vjust = -2, size = 20), # change the axis title
    axis.title.y = element_text (vjust = -0.1, angle = 90, size = 20), # change the axis title
    axis.text.x = element_text (size = 17, vjust = -0.25, colour = "black"),# change the axis label font attributes
    axis.text.y = element_text (size = 17, hjust = 1, colour = "black"), # change the axis label font attributes
    axis.ticks = element_line (colour = "black", size = 0.5), # sets the thickness and colour of axis ticks
    axis.ticks.length = unit(-0.25 , "cm"), # -ve length = inside ticks
    axis.ticks.margin = unit(0.5, "cm") # margin between the ticks and the text
  )