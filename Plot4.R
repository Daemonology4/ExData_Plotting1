##Exploratory plots for electricity consumption
##opens extracted zip file
filename <- c("household_power_consumption.csv")

#extracts through 2/2/2007 and converts ? to NA
two_days <- read.csv(filename, header = TRUE, sep = ";", nrows = 69516,
                     na.strings = "?")

#subsets out data to 2/1/2007
two_days <- two_days[-c(1:66636),]

#Combines date and time, converts $Date to POSIXlt, drops time
two_days$Date <- paste(two_days$Date, two_days$Time)
two_days$Date <- strptime(two_days[,1], format = "%d/%m/%Y %H:%M:%S")
two_days <- two_days[,-2]

#opens the PNG device
png(filename = "plot4.png")

#generates 4 plots under a with wrapper
par(mfcol = c(2,2))
with(two_days, {
  plot(Date, Global_active_power, type = "l", 
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  plot(Date, Sub_metering_1, 
       type = "l", 
       ylab = "Energy Sub Metering",
       xlab = "")
    lines(Date, Sub_metering_2, 
        type = "l", col = "Red")
    lines(Date, Sub_metering_3, 
        type = "l", col = "Blue")
  plot(Date, Voltage,
       type = "l", ylab = "Voltage",
       xlab = "datetime")
  plot(Date, Global_reactive_power,
       type = "l", ylab = "Global_reactive_power",
       xlab = "datetime")
})

# Closes PNG device
dev.off()
