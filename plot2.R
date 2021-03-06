## Reading data from file and subsetting to February days
elec <- read.csv("household_power_consumption.txt", sep = ";")
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")

## Transform data into Date, Time, and Numeric classes
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec$Time <- paste(elec$Date, elec$Time)
elec$Time <- strptime(elec$Time, "%Y-%m-%d %H:%M:%S")
elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))

## Commands for generating png file
png(file = "Plot2.png")
plot(elec$Time, elec$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()