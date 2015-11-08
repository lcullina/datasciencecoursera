powerdata <- read.csv("household_power_consumption.txt", sep = ";")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[which(powerdata$Date > "2007-01-31"),]
powerdata <- powerdata[which(powerdata$Date < "2007-02-03"),]
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_active_power <- powerdata$Global_active_power / 500

powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, "%Y-%m-%d %H:%M:%S")
png("plot3.png", width = 480, height = 480)


plot(powerdata$DateTime, powerdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
lines(powerdata$DateTime, powerdata$Sub_metering_2, type = "l", col = "red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1, 1), col = c("black", "red", "blue"))
dev.off()