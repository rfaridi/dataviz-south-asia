library(WDI)
# library(countrycode)
# cc=countrycode_data
# cc$iso2c[cc$country.name=="BRAZIL"]  #BR
# cc$iso2c[cc$country.name=="CHINA"] #CN
# cc$iso2c[cc$country.name=="VIETNAM"] #VN
edu <- WDIsearch('education')
military <- WDIsearch('military')
inds <- c(edu[375,1],military[2,1])
names  <- c(edu[375,2],military[2,2])
wdiData <- WDI(country=c("BD","IN","PK","LK"), indicator=inds,
               start=1972, end=format(Sys.Date(), "%Y"), extra=FALSE)

wdiData <- WDI(country=c("BD","IN","PK","LK"), indicator=inds,
                extra=FALSE)
colnum <- match(inds, names(wdiData))
names(wdiData)[colnum] <- names

# the above is not working, right now just trying much simpler things

# run of gdp per capital in constant dollar

# First search for what type of variable

sres <- WDIsearch("GDP per capita")
ind <- sres[9,1]
name <-sres[9,2]

pcgdp <- WDI(country=c("BD","IN","PK","LK"),
             indicator = ind,
             start=1972,
             extra = F)
colnum <- match(ind,names(pcgdp))
names(pcgdp)[colnum] <- "pcgdp_cons"
save(pcgdp,file="./RDATA/pcgdp.RData")

