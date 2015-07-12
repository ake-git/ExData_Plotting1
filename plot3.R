electric <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")

feb <- subset(electric, electric$Date == "1/2/2007" | electric$Date == "2/2/2007")

feb$DateTime <- strptime(paste(feb$Date, feb$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

feb$Sub_metering_1 <- as.numeric(as.character(feb$Sub_metering_1))
feb$Sub_metering_2 <- as.numeric(as.character(feb$Sub_metering_2))
feb$Sub_metering_3 <- as.numeric(as.character(feb$Sub_metering_3))

plot(feb$DateTime, feb$Sub_metering_1, ylab="Energy sub metering", type="l", xlab="")
lines(feb$DateTime, feb$Sub_metering_2, col=2)
lines(feb$DateTime, feb$Sub_metering_3, col=4)
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"))

dev.copy(png, file="plot3.png")

dev.off()