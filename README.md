# Nettverkmekker
##Lage nettverk ved hjelp av R, networkD3 og Excel
---
Dette lille skriptet er tilpasset etter forespørsel fra SUJO til et prosjekt i en norsk avisredaksjon.
Filene "graf.R", "grafdata.xlsx" og "graftilpassing.xlsx" legger du i en egnet mappe på maskinen din. 
For å få skriptet til å fungere, trengs følgende:

- [Installere R](https://cran.uib.no/)
- [Installere RStudio](https://www.rstudio.com/products/rstudio/download/#download)

Etter å ha installert disse programmene, åpne Rstudio. I konsollen må du navigere til mappen der du har lagret filene. Det gjør du ved å skrive:

`setwd("<STI TIL MAPPE>")`

Deretter må du installere noen R-pakker. Skriv:

`install.packages("networkD3")
install.packages("htmlwidgets")
install.packages("readxl")
`

Du endrer på navn i filen "grafdata.xlsx". **NB - Ikke endre på antall kolonner eller flytt på dem.** Tenk på dataene som en fra-til-matrise: I første kolonne er fra-navn, i andre kolonne til-navn.
I tredje kolonne kan du lage ulike kategorier som passer til navnet i kolonne 1. Disse kategoriene vil bli markert med en felles farge i den ferdige grafen.

Alle navn som skal inn i grafen, må nevnes minst én gang i kolonne 1.

I "graftilpassing.xlsx" kan du tilpasse grafen. MERK: Jeg får foreløpig ikke til å endre størrelsen på nodene. Må forske litt på det, enn så lenge vil dere ikke kunne justere nodestørrelser.I

Lukk alle Excel-filer før du kjører R-programmet. Det gjør du ved å skrive dette i konsollen:
`source("graf.R")`

Da genereres en html-fil i samme mappe som filene dine. Du kan åpne denne i en nettleser.
Lykke til!
