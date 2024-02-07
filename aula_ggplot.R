library(tidyverse)

mtcars |>  
  ggplot() +  
  geom_point(aes( x=mpg,
                  y=wt,
                  color=as.factor(am),
                  size=as.factor(cyl)))



Alternativamente, vamos usar o pacote esquisse, que contém a função esquisser().