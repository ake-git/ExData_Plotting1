electric <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")

feb <- subset(electric, electric$Date == "1/2/2007" | electric$Date == "2/2/2007")

feb$DateTime <- strptime(paste(feb$Date, feb$Time, sep=" "), format = "%d/%m/%Y %H:%M:%S")

feb$Global_active_power <- as.numeric(as.character(feb$Global_active_power))

hist(feb$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col=2, ylim=c(0,1200))

dev.copy(png, file="plot1.png")

dev.off()