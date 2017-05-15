## Reading data from file and subsetting to February days
elec <- read.csv("household_power_consumption.txt", sep = ";")
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")

## Transform data into Date, Time, and Numeric classes
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec$Time <- paste(elec$Date, elec$Time)
elec$Time <- strptime(elec$Time, "%Y-%m-%d %H:%M:%S")
elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))
elec$Global_reactive_power <- as.numeric(as.character(elec$Global_reactive_power))
elec$Voltage <- as.numeric(as.character(elec$Voltage))
elec$Sub_metering_1 <- as.numeric(as.character(elec$Sub_metering_1))
elec$Sub_metering_2 <- as.numeric(as.character(elec$Sub_metering_2))
elec$Sub_metering_3 <- as.numeric(as.character(elec$Sub_metering_3))

## Commands for generating png file
png(file = "Plot4.png")
par(mfrow = c(2,2))
plot(elec$Time, elec$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

plot(elec$Time, elec$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(elec$Time, elec$Sub_metering_1, type="l", col="black", ylab = 
           "Energy sub metering", xlab = "")
lines(elec$Time, elec$Sub_metering_2, col = "red")
lines(elec$Time, elec$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, bty = "n", cex=.9, col = c("black","red","blue"))

plot(elec$Time, elec$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()