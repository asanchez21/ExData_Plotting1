# Plot 3

# Read data
filepath <- "C:/Users/asancheza/Dropbox/Coursera/04 Exploratory Data Analysis/Assigment 1/household_power_consumption.txt"
data <- 
  read.table(file = filepath, sep = ";", header = TRUE, dec = ".",
             stringsAsFactors=FALSE, na.strings = "?")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Construc graph
subsetData$datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetData$Sub_metering_1 <- as.numeric(subsetData$Sub_metering_1)
subsetData$Sub_metering_2 <- as.numeric(subsetData$Sub_metering_2)
subsetData$Sub_metering_3 <- as.numeric(subsetData$Sub_metering_3)

graphpath <- "C:/Users/asancheza/Dropbox/Coursera/04 Exploratory Data Analysis/ExData_Plotting1/plot3.png"
png(graphpath, width=480, height=480)
with(subsetData, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(subsetData, lines(datetime, Sub_metering_2, type="l", col="red"))
with(subsetData, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
