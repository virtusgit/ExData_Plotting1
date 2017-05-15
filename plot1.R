elec <- read.csv("household_power_consumption.txt", sep = ";")
elec <- subset(elec, Date == "1/2/2007" | Date == "2/2/2007")
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
elec$Time <- paste(elec$Date, elec$Time)
elec$Time <- strptime(elec$Time, "%Y-%m-%d %H:%M:%S")
elec$Global_active_power <- as.numeric(as.character(elec$Global_active_power))

png(file = "Plot1.png")
hist(elec$Global_active_power, col = "red", xlab = "Global Active Power 
     (kilowatts)", main = "Global Active Power")
dev.off()