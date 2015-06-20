# Uploading data
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

options(scipen=999)

png(filename = 'plot2.png', width = 480, height = 480, units = 'px')

BaltimoreNEI <- NEI[(NEI$fips=="24510"),]
BaltimoreEmissions <- data.frame()
BaltimoreEmissions <- aggregate(BaltimoreNEI$Emissions, by=list(BaltimoreNEI$year), FUN=sum)

names(BaltimoreEmissions) <- c("Year", "PM2.5 Emissions (in Tons)")
plot(BaltimoreEmissions, pch=20, type="l", main="2. PM2.5 Emissions in Baltimore City", lwd=2)

dev.off()
