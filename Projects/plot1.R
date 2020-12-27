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