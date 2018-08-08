#Read data from downloaded file
dataFile <- "./household_power_consumption.txt"
fullDataSet <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get only 2 days worth of data for further analysis for the dates ....02/01/2007 and 02/02/2007
workingDataSet <- fullDataSet[fullDataSet$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the plot. Use strptime to convert Date and Time to the needed format
datetime <- strptime(paste(workingDataSet$Date, workingDataSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workingDataSet$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Close device so that data is flushed
dev.off()
