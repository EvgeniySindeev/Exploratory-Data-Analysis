# Across the United States, 
# how have emissions from coal 
# combustion-related sources changed from 1999–2008?

library(ggplot2)
# Uploading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

options(scipen=999)

png(filename = 'plot4.png', width = 480, height = 480, units = 'px')

# Subset coal combustion related NEI data
CombustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
CoalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
CoalCombustion <- (CombustionRelated & CoalRelated)
CombustionSCC <- SCC[CoalCombustion,]$SCC
CombustionNEI <- NEI[NEI$SCC %in% CombustionSCC,]

ggplot(CombustionNEI,aes(factor(year),Emissions/10^5)) + geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) + labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
