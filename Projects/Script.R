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

# plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

# plot 2
png(filename = "plot2.png", width = 480, height = 480)
plot(x = power$DTIME , y = power$Global_active_power, type = "l", 
     xlab = " ", ylab = "Global Active Power (kilowatts)")
dev.off()


# plot 3
png(filename = "plot3.png", width = 480, height = 480)
plot(x = power$DTIME, y = power$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering", xlab = " ")
lines(x = power$DTIME, y = power$Sub_metering_2, col = "red")
lines(x = power$DTIME, y = power$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c('black','red','blue'), lty = 1)
dev.off()

# plot 4


