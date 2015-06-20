# Compare emissions from motor vehicle sources in 
# Baltimore City with emissions from motor 
# vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

# Uploading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

options(scipen=999)

png(filename = 'plot6.png', width = 480, height = 480, units = 'px')

Vehicles <- grep('Vehicle',SCC$EI.Sector, ignore.case = TRUE)
VehiclesSCC <- SCC[Vehicles,]$SCC
VehiclesNEI <- NEI[NEI$SCC %in% VehiclesSCC,]

VehiclesBaltimoreNEI <- VehiclesNEI[VehiclesNEI$fips == 24510,]
VehiclesBaltimoreNEI$city <- "Baltimore City"

VehiclesLosAngelesNEI <- VehiclesNEI[VehiclesNEI$fips=="06037",]
VehiclesLosAngelesNEI$city <- "Los Angeles County"

ComeTogether <- rbind(VehiclesBaltimoreNEI, VehiclesLosAngelesNEI)

ggplot(ComeTogether, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=year),stat="identity") +facet_grid(scales="free", space="free", .~city) +
  guides(fill=FALSE) + theme_bw() +  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()
