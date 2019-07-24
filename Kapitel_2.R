##################    Kapitel 2   ############################
############### Workflow Grundlagen ##########################

#Grundlagen der Codierung

#Taschenrechner
1 / 200 * 30
(59 +73 +2) / 3
sin(pi / 2)

# Zuweisungsoperator <-
a <- 3 * 4
a  # Ausgabe des Wertes in Console
r_real <- 2.5  # Kommawert (double)
r_rocks <- 2 ^ 3 # Exponent
t_text <- "Hello World"  # String

#Funktionen aufrufen
seq10 <- seq(1,10)
seq_calc <- seq(1,10,length.out = 5)
seq_calc

#Übung 1
my_variable <- 10; my_variable #variable existiert noch nicht und ist falsch geschrieben

#Übung 2
library(tidyverse)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))

filter(mpg, cyl == 8)
filter(diamonds, carat > 3) # diamond->s

#Übung 3
# Alt + Shift + K -> Anzeige aller Keyboard shortcuts