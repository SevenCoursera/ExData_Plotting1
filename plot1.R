# ExData_Plotting1
# plot1.R: Seven: 09/05/2014: An overview of household global minute-averaged active power (in kilowatt) by histogram.

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

# Set the graphic device as PNG file with a size of 480 pixels by 480 pixels.
png(filename = "plot1.png", width = 480, height = 480)

# Set the background color of the plot to be transparent.
par(bg="transparent")

# Make the plot as required.
hist(EPC$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Close and save the plot file.
dev.off()

