library(adehabitat)
library(ellipse)

track = read.csv("DeerSample.csv")
track = na.omit(track)

summary(track)
head(track)

coordinates(track) = c("LONGITUDE", "LATITUDE")
class(track)

plot(track)

?mcp

demo(homerange)
