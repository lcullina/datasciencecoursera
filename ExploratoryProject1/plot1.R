
powerdata <- read.csv("household_power_consumption.txt", sep = ";")
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")
powerdata <- powerdata[which(powerdata$Date > "2007-01-31"),]
powerdata <- powerdata[which(powerdata$Date < "2007-02-03"),]

powerdata$Global_active_power <- as.numeric(powerdata$Global_active_power)
powerdata$Global_active_power <- powerdata$Global_active_power / 500
png("plot1.png", width = 480, height = 480)
hist(powerdata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()