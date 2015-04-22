library(adehabitatHR)

library(dplyr)

track = read.csv("DeerSample.csv")
track = na.omit(track)

track = filter(track, DATETIME >= 40603 & DATETIME <= 40633)

summary(track)
head(track)

trackSp = SpatialPoints(data.frame(track$LONGITUDE, track$LATITUDE))

trackClu = clusthr(trackSp)

plot(trackClu)

trackCp = mcp(trackSp, percent = 90)
plot(trackCp)
plot(trackSp, add = T)

HRs = mcp.area(trackSp, percent = seq(50, 100, by = 10))

---------------
  
trackKud = kernelUD(trackSp)
image(trackKud)

trackKudl = kernelUD(trackSp, h = "LSCV")
image(trackKudl)
plotLSCV(trackKudl)

trackHr = getverticeshr(trackKud)
plot(trackHr,col = 3)
plot(trackSp, add = T)


---------------------
  
library(adehabitatLT)
  
trans = as.ltraj(xy = cbind(track$LONGITUDE, track$LATITUDE), date = as.POSIXct(track$DATETIME  *60 * 60 *24, origin="1899-12-30"), id = "Deer")
plot(trans)