library(readxl)
library(networkD3)
library(htmlwidgets)

grafdata <- read_xlsx("grafdata.xlsx")
tilpass <- read_xlsx("graftilpassing.xlsx")

fra <- data.frame(grafdata[,1])
til <- data.frame(grafdata[,2])
fra <- as.character(unlist(fra))
til <- as.character(unlist(til))
size <- data.frame(grafdata[,4])
size <- as.integer(unlist(size))

nodefactors <- c(fra, til)
nodefactors <- as.factor(sort(unique(nodefactors)))
alle <- levels(nodefactors)

get.groups <- function(x){
  finn.rad <- which(alle[x] == grafdata[,1])[1]
  navn <- grafdata[finn.rad,1]
  gruppe <- grafdata[finn.rad,3]
  size <- grafdata[finn.rad,4]
  df <- data.frame(navn, gruppe, size)
  return(df)
}

grupper <- lapply(1:length(alle), function(x) get.groups(x))
grupper <- do.call("rbind", grupper)
fjern <- which(is.na(grupper[,1]) == TRUE)
if(length(fjern) > 0) {
  grupper[-fjern,]
}

noder <- data.frame(name=nodefactors, group=grupper[,2], size=as.character(grupper[,3]))

source <- match(fra, levels(nodefactors)) - 1
target <- match(til, levels(nodefactors)) - 1
value <- match(size, levels(nodefactors)) - 1
nodeSize <- as.integer(tilpass[9,2])
links <- data.frame(Source = source, Target = target, size=nodeSize)

#Tilpasninger
charge <- as.integer(tilpass[1,2])
linkDistance <- as.integer(tilpass[2,2])
zoom <- as.logical(tilpass[3,2])
opacity <- as.integer(tilpass[4,2]) / 100
fontSize <- as.integer(tilpass[5,2])
opacityNoHover <- as.integer(tilpass[6,2]) / 100
fontFamily <- as.character(tilpass[7,2])
legend <- as.logical(tilpass[8,2])


nettverk <- forceNetwork(Links = links, 
                  Nodes = noder,
                  Source= "Source", 
                  Target = "Target",
                  Group = "group",
                  Nodesize = "size",
                  NodeID = "name",
                  charge = charge, # node repulsion
                  linkDistance = linkDistance,
                  zoom = zoom, 
                  opacity = opacity,
                  fontSize=fontSize, 
                  opacityNoHover = opacityNoHover,
                  fontFamily = fontFamily,
                  legend = legend)

#Sys.setenv(PATH=paste(c(Sys.getenv("PATH"), "C:\\Users\\n633164\\AppData\\Local\\Pandoc;"), collapse=""))
saveWidget(nettverk, file="nettverk.html")

