# How have emissions from motor vehicle sources changed from 1999–2008 
# in Baltimore City?

library(ggplot2)

# Uploading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

options(scipen=999)

png(filename = 'plot5.png', width = 480, height = 480, units = 'px')

Vehicles <- grep('Vehicle',SCC$EI.Sector, ignore.case = TRUE)
VehiclesSCC <- SCC[Vehicles,]$SCC
VehiclesNEI <- NEI[NEI$SCC %in% VehiclesSCC,]

BaltimoreVehiclesNEI <- VehiclesNEI[VehiclesNEI$fips==24510,]

ggplot(BaltimoreVehiclesNEI,aes(factor(year), Emissions)) + geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +   labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()
