#plot4.R
#this code creates four graphs (plot4.png) shows how household energy usage varies over a 2-day period in February, 2007
#make sure the file exists in c:/data directory

#set working directory for input file.  Makesure the file is in this directory.
setwd("c:/data/")
inputFile <- "household_power_consumption.txt"

#load data from file
fullData <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Create subset of data with date condition
dataSubset <- subset(fullData, fullData$Date %in% c("1/2/2007","2/2/2007")) 

#data reformat
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSubset$Global_active_power)
globalReactPower <- as.numeric(dataSubset$Global_reactive_power)
voltage <- as.numeric(dataSubset$Voltage)
subMeter1 <- as.numeric(dataSubset$Sub_metering_1)
subMeter2 <- as.numeric(dataSubset$Sub_metering_2)
subMeter3 <- as.numeric(dataSubset$Sub_metering_3)

#plot4 graph
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

with(dataSubset, {
 plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

 plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

 plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
 lines(datetime, subMeter2, type="l", col="red")
 lines(datetime, subMeter3, type="l", col="blue")
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

 plot(datetime, globalReactPower, type="l", xlab="datetime", ylab="Global_reactive_power")
})
dev.off()