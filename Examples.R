library(adehabitatHR)
library(adehabitatHS)
library(adehabitatLT)
library(adehabitatMA)

library(dplyr)

track = read.csv("DeerSample.csv")
track = na.omit(track)

track = filter(track, DATETIME >= 40603 & DATETIME <= 40633)

summary(track)
head(track)

trackSP = SpatialPoints(data.frame(track$LONGITUDE, track$LATITUDE))

trackCLU = clusthr(trackSp)

plot(trackCLU)

trackCP = mcp(trackSP, percent = 90)
plot(trackCP)
plot(trackSP, add = T)

HRs = mcp.area(trackSP, percent = seq(50, 100, by = 5))

---------------
  
trackKUD = kernelUD(trackSP)
image(trackKUD)

trackKudl = kernelUD(trackSP, h = "LSCV")
image(trackKudl)
plotLSCV(trackKudl)

trackHr = getverticeshr(trackKUD)
plot(trackHr,col = 3)
