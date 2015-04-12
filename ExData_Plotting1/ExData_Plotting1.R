
# Load data from file
ElectricPowerConsumption <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
  col.names = colnames(read.table("household_power_consumption.txt", nrow = 1, header = TRUE, sep=";")), na.strings = "?")

# Data/Time convertation
ElectricPowerConsumption$Date <- as.Date(ElectricPowerConsumption$Date, "%d/%m/%Y")
ElectricPowerConsumption$Time <- paste(ElectricPowerConsumption$Date, ElectricPowerConsumption$Time, sep=" ")
ElectricPowerConsumption$Time <- strptime(ElectricPowerConsumption$Time, "%Y-%m-%d %H:%M:%S")

# Select date range
ElectricPowerConsumptionSubSet <- subset(ElectricPowerConsumption, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert Global_active_power to numeric
ElectricPowerConsumptionSubSet$Global_active_power <- as.numeric(ElectricPowerConsumptionSubSet$Global_active_power)

#Plot 1
png("plot1.png", width = 480, height = 480)
hist(ElectricPowerConsumptionSubSet$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off

# Plot 2
png("plot2.png", width = 480, height = 480)
plot(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
dev.off

# Plot 3
png("plot3.png", width = 480, height = 480)
plot(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Sub_metering_2, col='red')
lines(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid')
dev.off

# Plot 4
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Global_active_power, ylab='Global Active Power', xlab='', type='l')
plot(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Voltage, xlab='datetime', ylab='Voltage', type='l')
plot(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Sub_metering_2, col='red')
lines(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Sub_metering_3, col='blue')
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col=c('black', 'red', 'blue'), lty='solid')
plot(ElectricPowerConsumptionSubSet$Time, ElectricPowerConsumptionSubSet$Global_reactive_power, xlab='datetime', ylab='Global_reactive_power', type='l')
dev.off

# That's all, folks!