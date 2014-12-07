#plot3.R
#this code creates a line graph (plot3.png) shows how household energy usage varies over a 2-day period in February, 2007
#make sure the file exists in c:/data directory

#set working directory for input file.  Makesure the file is in this directory.
setwd("c:/data/")
inputFile <- "household_power_consumption.txt"

#load data from file
fullData <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Create subset of data with date condition
dataSubset <- subset(fullData, fullData$Date %in% c("1/2/2007","2/2/2007"), select=c(Date,Time,Sub_metering_1,Sub_metering_2,Sub_metering_3)) 

#data reformat
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMeter1 <- as.numeric(dataSubset$Sub_metering_1)
subMeter2 <- as.numeric(dataSubset$Sub_metering_2)
subMeter3 <- as.numeric(dataSubset$Sub_metering_3)

#plot3 graph
png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", xlab="",ylab="Energy Submetering")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

