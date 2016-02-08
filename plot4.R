# Plot 4

# Read data
filepath <- "C:/Users/asancheza/Dropbox/Coursera/04 Exploratory Data Analysis/Assigment 1/household_power_consumption.txt"
data <- 
  read.table(file = filepath, sep = ";", header = TRUE, dec = ".",
             stringsAsFactors=FALSE, na.strings = "?")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Construc graph
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
subsetData$Global_reactive_power <- as.numeric(subsetData$Global_reactive_power)
subsetData$Voltage <- as.numeric(subsetData$Voltage)
subsetData$datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

graphpath <- "C:/Users/asancheza/Dropbox/Coursera/04 Exploratory Data Analysis/ExData_Plotting1/plot4.png"
png(graphpath, width=480, height=480)
par(mfrow = c(2, 2)) 

plot(subsetData$datetime, subsetData$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

plot(subsetData$datetime, subsetData$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")

with(subsetData, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(subsetData, lines(datetime, Sub_metering_2, type="l", col="red"))
with(subsetData, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(subsetData$datetime, subsetData$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
