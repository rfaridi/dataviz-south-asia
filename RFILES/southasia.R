library(WDI)
inds <- c('SP.DYN.TFRT.IN','SP.DYN.LE00.IN', 'SP.POP.TOTL',
'NY.GDP.PCAP.CD', 'SE.ADT.1524.LT.FE.ZS', 'SH.DYN.MORT')
indnams <- c("fertility.rate", "life.expectancy", "population",
"GDP.per.capita.Current.USD", "15.to.25.yr.female.literacy","Mortality Rate")
wdiSA <- WDI(country=c("BD","IN","PK","LK"), indicator=inds,
start=1972, end=format(Sys.Date(), "%Y"), extra=FALSE)
colnum <- match(inds, names(wdiSA))

names(wdiSA)[colnum] <- indnams

save(wdiSA,file="wdiSA.RData")

## Create a motion chart
library(googleVis)
#WorldBank <- droplevels(subset(wdiData, !region %in% "Aggregates"))
M <- gvisMotionChart(wdiData,
                      idvar="country", 
                      timevar="year",
                      xvar="life.expectancy", 
                      yvar="fertility.rate",
                      colorvar="iso2c", 
                      sizevar="population",
                      options=list(width=640, height=420))
## Display the chart in the browser
plot(M)

