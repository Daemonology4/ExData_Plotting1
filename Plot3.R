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

#Opens PNG
png(filename = "Plot3.png")
#generates time plot of sub metering levels
plot(two_days$Date, two_days$Sub_metering_1, 
     type = "l", 
     ylab = "Energy Sub Metering",
     xlab = "")
lines(two_days$Date, two_days$Sub_metering_2, 
      type = "l", col = "Red")
lines(two_days$Date, two_days$Sub_metering_3, 
      type = "l", col = "Blue")
legend("topright", pch = "_", col = c("Black", "Red", "Blue"),
       legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))

#Closes PNG
dev.off()
