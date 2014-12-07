#plot1.R
#this code creates a histogram (plot1.png) shows how household energy usage varies over a 2-day period in February, 2007
#make sure the file exists in c:/data directory

#set working directory for input file.  Makesure the file is in this directory.
setwd("c:/data/")
inputFile <- "household_power_consumption.txt"

#load data from file
fullData <- read.table(inputFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Create subset of data with date condition
dataSubset <- subset(fullData, fullData$Date %in% c("1/2/2007","2/2/2007"), select=c(Date,Time,Global_active_power)) 

#data reformat
datetime <- strptime(paste(dataSubset$Date, dataSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(dataSubset$Global_active_power)


#plot1 graph
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()