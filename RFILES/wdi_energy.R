library(WDI)
library(countrycode)
cc=countrycode_data
cc$iso2c[cc$country.name=="BRAZIL"]  #BR
cc$iso2c[cc$country.name=="CHINA"] #CN
cc$iso2c[cc$country.name=="VIETNAM"] #VN
a=WDIsearch('energy')
inds <- c(a[2,1],a[3,1],a[5,1],a[12,1])
names  <- c(a[2,2],a[3,2],a[5,2],a[12,2])
wdiData <- WDI(country=c("BD","IN","PK","LK","AF","VN","CN","BR"), indicator=inds,
start=2001, end=format(Sys.Date(), "%Y"), extra=FALSE)
colnum <- match(inds, names(wdiData))
names(wdiData)[colnum] <- names
write.csv(wdiData,file="energyWDI.csv")
----------- Electricity --------
b=WDIsearch('electricity')
inds <- c(b[1,1],b[3,1],b[4,1],b[6,1],b[6,1],b[8,1],b[10,1],b[13,1],b[16,1])
names  <- c(b[1,2],b[3,2],b[4,2],b[6,2],b[6,2],b[8,2],b[10,2],b[13,2],b[16,2])
wdiData <- WDI(country=c("BD","IN","PK","LK","AF","VN","CN","BR"), indicator=inds,
               start=2001, end=format(Sys.Date(), "%Y"), extra=FALSE)
colnum <- match(inds, names(wdiData))
names(wdiData)[colnum] <- names
write.csv(wdiData,file="electricityWDI.csv")