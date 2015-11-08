powerdata <- read.csv("household_power_consumption.txt", sep = ";")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[which(powerdata$Date > "2007-01-31"),]
powerdata <- powerdata[which(powerdata$Date < "2007-02-03"),]
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_active_power <- powerdata$Global_active_power / 500

powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, "%Y-%m-%d %H:%M:%S")
png("plot4.png", width = 480, height = 480)

par(mfrow= c(2,2))
plot(powerdata$DateTime,powerdata$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(powerdata$DateTime, powerdata$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(powerdata$DateTime, powerdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
lines(powerdata$DateTime, powerdata$Sub_metering_2, type = "l", col = "red")
lines(powerdata$DateTime, powerdata$Sub_metering_3, type = "l", col = "blue")

plot(powerdata$DateTime, powerdata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
