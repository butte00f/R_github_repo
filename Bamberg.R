#Schulung Bamberg

############### Voraussetzungen ######################

library(tidyverse)

ggplot2::mpg


################ Plot erzeugen ########################


#Übung 1
ggplot(data = mpg) # nichts zu sehen

#Übung 2
nrow(mtcars) # 32 zeilen

#Übung 3
?mpg   # Antriebsart

#Übung 4
ggplot(mpg) + geom_point(mapping = aes(x = hwy, y = cyl))

#Übung 5
ggplot(mpg) + geom_point(mapping = aes(x = class, y = drv)) # Punkte liegen übereinander

