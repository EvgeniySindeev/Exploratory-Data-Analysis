# Of the four types of sources indicated by the type 
# (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases 
# in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
# Uploading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

options(scipen=999)

png(filename = 'plot3.png', width = 480, height = 480, units = 'px')

BaltimoreNEI <- NEI[(NEI$fips=="24510"),]

ggplot(BaltimoreNEI, aes(factor(year), Emissions,fill=type)) +
  geom_bar(stat="identity") +   theme_bw() + guides(fill=FALSE)+
  facet_grid(.~type,scales = "free",space="free") + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))

dev.off()
