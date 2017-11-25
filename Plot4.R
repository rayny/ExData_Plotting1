png(filename = "Plot4.png")
data1 <- read.table("household_power_consumption.txt", as.is = TRUE, sep = ";", header = TRUE, na.strings = "?")
data1 <- subset(data1, Date %in% c("1/2/2007", "2/2/2007"))
data1$datetime <- strptime(paste(data1$Date, data1$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))

plot(data1$datetime, data1$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power", xaxt="n")
axis(1, at=seq(min(data1$datetime), max(data1$datetime), length.out = 3), labels = c("Thu", "Fri", "Sat"),col = NA, col.ticks = 1)
lines(data1$datetime, data1$Global_active_power)

plot(data1$datetime, data1$Voltage, type = "n", xlab = "datetime", ylab = "Voltage", xaxt="n")
axis(1, at=seq(min(data1$datetime), max(data1$datetime), length.out = 3), labels = c("Thu", "Fri", "Sat"),col = NA, col.ticks = 1)
lines(data1$datetime, data1$Voltage)

plot(data1$datetime, data1$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering", xaxt="n")
axis(1, at=seq(min(data1$datetime), max(data1$datetime), length.out = 3), labels = c("Thu", "Fri", "Sat"),col = NA, col.ticks = 1)
lines(data1$datetime, data1$Sub_metering_1)
lines(data1$datetime, data1$Sub_metering_2, col="red")
lines(data1$datetime, data1$Sub_metering_3,col="purple")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "purple"), lty=1, bty="n")

plot(data1$datetime, data1$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power", xaxt="n")
axis(1, at=seq(min(data1$datetime), max(data1$datetime), length.out = 3), labels = c("Thu", "Fri", "Sat"),col = NA, col.ticks = 1)
lines(data1$datetime, data1$Global_reactive_power)

dev.off()