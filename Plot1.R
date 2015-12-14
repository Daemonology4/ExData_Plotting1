##Exploratory plots for electricity consumption
##opens extracted zip file
filename <- c("household_power_consumption.csv")

#extracts through 2/2/2007 and converts ? to NA
two_days <- read.csv(filename, header = TRUE, sep = ";", nrows = 69516,
                     na.strings = "?")

#subsets out data to 2/1/2007
two_days <- two_days[-c(1:66636),]

#Opens PNG device
png(filename = "Plot1.png")

#Combines date and time, converts $Date to POSIXlt, drops time
two_days$Date <- paste(two_days$Date, two_days$Time)
two_days$Date <- strptime(two_days[,1], format = "%d/%m/%Y %H:%M:%S")
two_days <- two_days[,-2]

#generates frequency plot of global active power
hist(two_days$Global_active_power, col = "Red",
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

#Closes device
dev.off()
