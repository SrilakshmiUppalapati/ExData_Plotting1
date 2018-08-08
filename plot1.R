
#Read data from downloaded file
dataFile <- "./household_power_consumption.txt"
fullDataSet <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Get only 2 days worth of data for further analysis for the dates ....02/01/2007 and 02/02/2007
workingDataSet <- fullDataSet[fullDataSet$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the histogram
globalActivePower <- as.numeric(workingDataSet$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close the device so data is flushed
dev.off()
