powerdata <- read.csv("household_power_consumption.txt", sep = ";")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[which(powerdata$Date > "2007-01-31"),]
powerdata <- powerdata[which(powerdata$Date < "2007-02-03"),]
powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_active_power <- powerdata$Global_active_power / 500

powerdata$DateTime <- paste(powerdata$Date, powerdata$Time)
powerdata$DateTime <- strptime(powerdata$DateTime, "%Y-%m-%d %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(powerdata$DateTime, powerdata$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)" , xlab = "")
dev.off()
