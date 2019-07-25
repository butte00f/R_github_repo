##################    Kapitel 3   ############################
############# Datentransformation mit dplyr  #################
?dplyr
dplyr # dplyr ist ein Paket mit funktionen und Daten zur Transformation,
      # herausholen benötigter Daten aus Datensätzen

### Voraussetzungen ###

library(nycflights13)
library(tidyverse)
flights

### Datentypen ###
#<int> = integer , <dbl> = double, <chr> = Character/String, <dttm> = time
# weitere Datentypen

# <lgl> = logische Typen (TRUE or FALSE)
# <fctr> = Faktoren, kategoriale Variablen mit festen möglichen Werten
# <date> = Datum

### dplyr Grundlagen
# 5 Schfunktionen
# filter()  ->    herausgreifen von Werten
# arrange() ->    anordnen
# select()  ->    nach Variablennamen wählen
# mutate()  ->    neue Variable mit Funktionen vorhandener erzeugen
# summarize()->   viele Werte in kurzdarstellung zusammenfassen

# group_by() ->   

dplyr::filter(flights, month == 1, day ==1)
# modifizierte Daten speichern

jan1 <- filter(flights, month == 1, day ==1)

ggplot(jan1) + geom_bar(mapping = aes(x = dep_time, fill = dep_time))

################### Vergleiche ###################

filter(flights, month == 1)
# !! unterschiedliche Datentypen nicht miteinander vergleichen !!
sqrt(2) ^2 == 2  # FALSE
near (sqrt(2) ^2, 2)  # TRUE,

### Boolsche Operatoren
# oder | , und &, not ! -> ergeben Daten
### Logische Verknüpfungen
# oder ||, und &&, gleich == -> ergeben TRUE oder FALSE


filter (flights, month == 12 | month == 11)
### Inhaltsvergleich / Schnittmenge
# %in%  x in y

novdec <- filter(flights, month %in% c(11,12))
filter(novdec, !(arr_delay > 120 | dep_delay > 120)) # entspricht
filter(novdec, arr_delay <= 120 | dep_delay <= 120)
x = NA
y <- 5
x == y
is.na(novdec)
### Fehlende Werte
# bewahren der Fehlwerte bei filtern

df <- tibble(x = c(1, NA, 3))
fehlt <- filter(df, x > 1) ; fehlt # NA fehlt
is_da <- filter(df, x > 1 | is.na(x)); is_da # NA ist da

#Übung 1
arr120 <- filter (flights, arr_delay >= 120); arr120
dest <- filter (flights, dest == "IAH" | dest == "HOU"); dest
airline <- filter (flights, carrier == "UA" |carrier == "AA" | carrier == "DL"); airline
summer <- filter (flights, month > 6 & month < 10); summer
dep120 <- filter (flights, dep_delay >= 120 & arr_delay <= 0); dep120
arr1dep05 <- filter (flights, dep_delay >= 60 & (dep_delay - arr_delay >= 30)); arr1dep05
dep0to6 <- filter (flights, dep_time >= 0 & dep_time <= 600); dep0to6

#Übung 2
?between
bet0to6 <- filter (flights, between(dep_time, 0,  600)); bet0to6 # between nutzen
#Übung 3
depmiss <- filter (flights, is.na(dep_time)); nrow(depmiss) # 8255 mal
varmiss <- filter (flights, is.na(dep_time)); varmiss # es fehlt auch ankunft und dauer stellt Fulgausfälle dar
#Übung 4
p <- NA ^ 0; is.na(p) # FALSE weil Wert hoch 0 immer 1 ist
p

########################## Zeilen mit arrange() anordnen #######################

arrange(flights, year, month, day) # Nach Spalten sotieren
arrange(flights, desc(arr_delay))  # Nach Spalte absteigend sortieren
df <- tibble(x = c(5, 2 , NA))
arrange(df, x)         # Fehlende Werte werden immer am Ende einsortiert
arrange(df, desc(x))

#Übung 1
?arrange
arrange(df, desc(is.na(x))) # NA Werte an den Anfang stellen
#Übung2
arrange(flights, desc(arr_delay))  # Verspätungen absteigend
arrange(flights, dep_time)  # Abflugzeit aufsteigend
#Übung 3
flighttime <- arrange(flights, air_time)
select(flighttime, flight, carrier)  # Flugzeit aufsteigend
#Übung 4
flighttime2 <- arrange(flights, desc(air_time))
select(flighttime2, flight, carrier) # Flugzeit absteigend

############################  Spalten mit select() auswählen  #######################
select(fligths, year, month, day) # alle gewünschten Spalten auswählen
select(flights, year:day) # Berich an Spalten von:bis auswählen
select(flights, -(year:day)) # alle Spalten außer von:bis auswählen

# select "Hilfsfunktionen"
select(flights, starts_with("abc")) # sucht Namen mit "abc" am Beginn
select(flights, starts_with("xyz")) # sucht Namen mit "xyz" am Ende
select(flights, contains("ijk")) # sucht Namen mit "ijk"
select(flights, matches("(.)\\1")) # wählt Werte die den reguläeren Ausdruck entsprechen
# reguläre Ausdrücke siehe Kapitel_11
select(flights, num_range("x",1:3)) # sucht nach x1, x2, x3
select(flights, time_hour, air_time, everything())

### Variablen umbenennen mit rename()
rename(flights, tail_num = tailnum)

#Übung 1
select(flights, dep_time, dep_delay, arr_time, arr_delay, everything())
select(flights, dep_time, dep_delay, arr_time, arr_delay)

#Übung 2
select(flights, dep_time, dep_time) # wird nur einmal angezeigt
#Übung 3
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
one_of(flights)  # Vektor mit Strings
select(flights, one_of(vars))  # Vektor wird in der Suche verwendet

#Übung 4
select(flights, contains("time", ignore.case = FALSE)) # Groß/kleinschreibung beachten
?select

##############  Varialen mit mutate() hinzufügen #####################



       