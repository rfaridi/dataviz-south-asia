library(ggplot2)
library(directlabels)
library(ggthemes)

load("./RDATA/pcgdp.RData")

pcgdp_gr <- ggplot(pcgdp,aes(year,pcgdp_cons)) + 
              theme_minimal()+
              geom_line(aes(color=country)) +
              scale_x_continuous(limits = c(1990, 2014))

direct.label(pcgdp_gr,'last.bumpup')
