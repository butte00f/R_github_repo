#################   Kapitel 1   ###################### 
######### Datenvisualisierung mit ggplot2 ############


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

#Übung5
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, y= ..prop.., group = 1)) #weiß nicht ?
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = color, group = 1, y = ..prop..))
?geom_bar

############### Positionsanpassungen #######################
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, color = cut)) # color = Rahmenfarbe
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = cut)) # fill = Füllfarbe
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity)) # Füllfarbe Balken nach clarity unterteilt

ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), position = "identity") # Balken überlappen (nicht sinnvoll)
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), alpha = 1/5, position = "identity") # alpha = Teil-Transparenz
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), fill = NA, position = "identity") # fill NA = Vollkommen Transparent
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), position = "fill") # pos = fill Auf selbe Höhe stapeln
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = cut), position = "stack") # pos = stack Daten aufstapeln/ keine überlappung
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge") # dodge = Balken nebeneinander
#jitter
ggplot(mpg) + geom_point(mapping = aes(x = displ, y = hwy), position = "jitter") # jitter = Zufallsrauschen für Punkte
#hinzufügen um überlappte Punkte sichtbar zu machen.bringt leicht ungenauere, aber dafür mehr sichtbare Information
ggplot(mpg) + geom_jitter(mapping = aes(x = displ, y = hwy))

#Übung1
ggplot(mpg) + geom_point(mapping = aes(x = cty, y = hwy))
#Problem: viele Punkte überlagern sich, lässt sich mit jitter lösen 
ggplot(mpg) + geom_jitter(mapping = aes(x = cty, y = hwy))
#Übung2
?geom_jitter()
ggplot(mpg) + geom_jitter(mapping = aes(x = cty, y = hwy), width = 0.2, heigth = 0.2)
#heigth and width
#Übung3
?geom_count()
ggplot(mpg) + geom_count(mapping = aes(x = cty, y = hwy, size = stat(prop)))
ggplot(mpg) + geom_count(mapping = aes(x = cty, y = hwy), position = "identity")
#Übung4
?geom_boxplot()
mpg
ggplot(mpg) + geom_boxplot(mapping = aes(x = class, y = hwy), position = "dodge2") # standard pos Anpassung =

############### Koordinatensysten ############################

ggplot(mpg) + geom_boxplot(mapping = aes(x = class, y = hwy))
ggplot(mpg) + geom_boxplot(mapping = aes(x = class, y = hwy)) + coord_flip() #Koordinaten x, y tauschen


## maps
?map_data
install.packages("maps")
wo <- map_data("world")
ggplot(wo, aes(long, lat, group = group)) + geom_polygon(fill = "green", color= "black") +
   coord_quickmap()

### Quickmap - 
nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) + geom_polygon(fill = "white", color= "black") +
   coord_quickmap() # korrektes Höhen/Längenverhälnis für Karte

### Polarkoordinaten
ggplot(data = diamonds) +
   geom_bar(mapping = aes(x = cut, fill = cut), width = 1,  show.legend = FALSE) +
 #  theme(aspect.ratio = 1) +
   labs(x = NULL, y = NULL) +
   coord_flip() + 
   coord_polar()

#Übung1

diamonds
ggplot(diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), width = 1, position = "stack") +
   coord_polar()
#Übung2
?labs  # labels setzen, verstecken
#Übung3
wo <- map_data("world")
ggplot(wo, aes(long, lat, group = group)) + geom_polygon(fill = "green", color= "black") +
   coord_quickmap()

install.packages("mapproj")
?coord_map
nz <- map_data("nz")
ggplot(nz, aes(long, lat, group = group)) + geom_polygon(fill = "green", color= "black") +
   coord_map(projection = "sinusoidal")

#Übung4
?geom_abline
?coord_fixed()

ggplot(mpg) + geom_point(mapping = aes(x = cty, y = hwy)) +
             geom_abline() +  # nicht ganz klar
              coord_fixed()    # koordinatensysteme ratio ist bei allen gleich
