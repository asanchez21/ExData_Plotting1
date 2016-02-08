# Plot 2

# Read data
filepath <- "C:/Users/asancheza/Dropbox/Coursera/04 Exploratory Data Analysis/Assigment 1/household_power_consumption.txt"
data <- 
  read.table(file = filepath, sep = ";", header = TRUE, dec = ".",
             stringsAsFactors=FALSE, na.strings = "?")
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Construct graph
subsetData$datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subsetData$Global_active_power <- as.numeric(subsetData$Global_active_power)
graphpath <- "C:/Users/asancheza/Dropbox/Coursera/04 Exploratory Data Analysis/ExData_Plotting1/plot2.png"
png(graphpath, width=480, height=480)
plot(subsetData$datetime, subsetData$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
