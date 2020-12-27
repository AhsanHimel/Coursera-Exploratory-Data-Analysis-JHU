# Reading data
setwd("Projects/")
power <- read.table(unzip("exdata_data_household_power_consumption.zip"), 
                    sep=";", 
                    header = T, 
                    na="?", 
                    colClasses = c("character",
                                   "character",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric",
                                   "numeric"))
power <- power[which(power$Date == "2/2/2007" | power$Date=="1/2/2007"), ]
power$DTIME <- strptime(paste(power$Date, power$Time),
                        format = "%d/%m/%Y %H:%M:%S")

# plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(x = power$DTIME , y = power$Global_active_power, type = "l",
     xlab = " ", ylab = "Global Active Power")
plot(x = power$DTIME , y = power$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")
plot(x = power$DTIME, y = power$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering", xlab = " ")
lines(x = power$DTIME, y = power$Sub_metering_2, col = "red")
lines(x = power$DTIME, y = power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c('black', 'red', 'blue'), lty = 1, bty = "n")
plot(x = power$DTIME , y = power$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")
dev.off()