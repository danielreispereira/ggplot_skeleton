# dotplot interesting example
# from: http://r-statistics.co/Top50-Ggplot2-Visualizations-MasterList-R-Code.html

# devtools::install_github("hrbrmstr/ggalt")

# 
library(ggplot2)
library(scales)

#
theme_set(theme_classic())

# 
ggplot(cty_mpg, aes(x=make, y=mileage)) + 

#GEOMS  
  geom_point(col="tomato2", size=3) +
    geom_segment(aes(x=make, 
                   xend=make, 
                   y=min(mileage), 
                   yend=max(mileage)), 
               linetype="dashed", 
               size=0.1) +

#LABELS
  labs(title="Dot Plot", 
       subtitle="Make Vs Avg. Mileage", 
       caption="source: mpg") +  
  
#FLIP COORDINATES  
  coord_flip()