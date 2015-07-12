electric <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")

feb <- subset(electric, electric$Date == "1/2/2007" | electric$Date == "2/2/2007")

feb$DateTime <- strptime(paste(feb$Date, feb$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))

plot(feb$DateTime, feb$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, file="plot2.png")

dev.off()