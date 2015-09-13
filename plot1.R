## Coursera - Exploratory Data - 032 - September 2015
## Projet1 
## Source of data for this project: UC Irvine Machine Learning Repository
## URL: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption

## This project Rscript does the following:

# 1 - Reads the data at csv.file 
dataFile <- "./data/household_power_consumption.txt"
data <- read.csv(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# 2 - Prepare data for the projetc1
dataProj1 <- as.Date(data$Date)
dataProj1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 3 - Create the PNG - plot1
ActivePower <- as.numeric(dataProj1$Global_active_power)
png("plot1.png", width=480, height=480)
hist(ActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

# 4 - The PNG.file - plot1.png - is on the deafult directory

 