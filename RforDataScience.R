
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


################ visuelle Eigenschaften zuordnen ########################


#Übung 1
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = 3))
# Punkte sind rot, weil color (Typ text) eine Eigenschaft von geom_point (num) ist nicht von aes()
?geom_point
?aes

#Übung2
?mpg #kateorial (char) = manufact,model,trans,drv,class ; kontinuierlich (int, dbl) = displ,year,cyl,cty,hwy

#Übung3
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = cty, color = cty))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = cty, size = cty))
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = cty, shape = cty)) # error can not be mapped
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = cty, shape = class))

#Übung4
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = drv, size = drv, color = drv))

#Übung5
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy), shape = 22, size = 4, fill = "red", stroke = 2)
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = drv, color = drv), shape = 12, stroke = 2)
# Strich/Rahmen und dicke des rahmemns um die Form wird erzeugt wenn die Formen von geom_point verwendet werden 

#Übung6
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = drv, color = displ < 5), shape = 12, stroke = 2)
#Farbe verändert sich entsprechend Vergleichsoperation bei Werten (int/dbl)
?aes

################ Facetten ########################

#Übung Facetten 1
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = model)) +
   facet_wrap(~ displ)

#Übung Facetten 2
ggplot(mpg) + geom_point(mapping = aes(x = drv, y = cyl)) +
   facet_grid( drv ~ cyl)

#Übung Facetten 3/1
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy)) +
   facet_grid( drv ~ .)
#Übung Facetten 3/2
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy)) +
   facet_grid( . ~ cyl)

#Übung Facetten 4
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy)) +
   facet_wrap(~ class, nrow = 2)

#Übung Facetten 5
?facet_wrap  # nrow = number of rows, ncol = number of columns

#Übung Facetten 6
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = cty, color = manufacturer)) +
   facet_grid(~cyl ~class)


################ Geometrische Objekte ########################
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = drv), show.legend = FALSE) +
             geom_smooth(mapping = aes(x = displ, y = hwy, color = drv, linetype = drv), show.legend = FALSE)


ggplot(mpg, mapping = aes(x = displ, y = hwy))

#Übung1
ggplot( mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
   geom_smooth() +
   geom_line()

#Übung2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
   geom_point() +
   geom_smooth(se = FALSE)

#Übung3
# Legende wird angezeigt

#Übung4
# Statistik Abweichung wird entfernt

#Übung5
# sehen gleich aus

#Übung6
#Diagram1
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
   geom_point(show.legend = FALSE) +
   geom_smooth(show.legend = FALSE)
#Diagram2
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
   geom_point(show.legend = FALSE) +
   geom_smooth(show.legend = FALSE, mapping = aes(group = drv))
#Diagram3
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
   geom_point() +
   geom_smooth(mapping = aes(group = drv))
#Diagram4
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
   geom_point(mapping = aes(color = drv)) +
   geom_smooth()
#Diagram5
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
   geom_point(mapping = aes(color = drv), size = 3) +
   geom_smooth(mapping = aes(linetype = drv), size = 1.5)
#Diagram6
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
   geom_point(mapping = aes(color = drv))

################ Statistische Transformation ###################

?geom_pointrange
?stat_summary
?ggplot2
?vignette
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, stat = "prop"))

#Übung1
#Summierung aller y Werte zu eindeutige x-Werten.
ggplot(diamonds) + geom_pointrange(mapping = aes(x = cut, y = depth, ymin = min(depth), ymax = max(depth)), stat = "identity")

#Übung2
ggplot(diamonds) + geom_col(mapping = aes(x = cut, y = depth)) # benötigt y Werte
ggplot(diamonds) + geom_bar(mapping = aes(x = cut))

#Übung3
# stat_count ~ geom_bar, geom_boxplot ~ stat_boxplot, stat_smooth ~ geom_smooth,
# stat_summary ~ geom_pointrange ...

#Übung4
?stat_smooth
# berechnet:
# y - predicted value
# ymin, ymax - pointwise confidential interval around the mean
# se - Standard Abweichung

# parameter: span - wiggliness
############ Workflow Grundlagen ##########################

#Übung1
#geom_line, geom_smooth

#Übung2 (tippfehler)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
   geom_point() +
   geom_smooth(se = FALSE)

filter(mpg, cyl == 8)
filter(diamonds, carat > 3)
#Übung3
# Alle Shortcuts werden angezeigt
