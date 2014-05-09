# ExData_Plotting1
# plot3.R: Seven: 09/05/2014: An overview and comparison of energy sub-meterings by time series with lines.

# Load and attach required package(s).
require(data.table)

# Pre-settings for data loading.
# In this case, only data of the first two days in February 2007 will be loaded.
datefrom <- "1/2/2007"
days <- 2
rows <- 1440 * days

# Load data from dataset file. In this dataset, missing values are coded as "?". 
EPC <- fread("household_power_consumption.txt", skip=datefrom, nrows=rows, na.strings="?")
colNames <- colnames(fread("household_power_consumption.txt", nrows=0, header=TRUE))
setnames(EPC, names(EPC), colNames)

# Convert the date times to POSIXlt for time series plot.
dates <- strptime(paste(EPC$Date, EPC$Time), format='%d/%m/%Y %H:%M:%S')

# Set the graphic device as PNG file with a size of 480 pixels by 480 pixels.
png(filename = "plot3.png", width = 480, height = 480)

# To set the locale settings if they are not in English.
#Sys.setlocale(category = "LC_ALL", locale = "UK")

# Make the plot as required.
par(bg="transparent")
plot(dates, EPC$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
lines(dates, EPC$Sub_metering_2, col="red")
lines(dates, EPC$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.9)

# Close and save the plot file.
dev.off()

