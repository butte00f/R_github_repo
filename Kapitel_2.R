##################    Kapitel 2   ############################
############### Workflow Grundlagen ##########################

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
