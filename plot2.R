## Coursera - Exploratory Data - 032 - September 2015
## Projet1 - Plot2
## Source of data for this project: UC Irvine Machine Learning Repository
## URL: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption 

## This project Rscript does the following:

# 1 - Reads the data at csv.file
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# 2 - Prepare data for the projetc1
dataProj1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(dataProj1$Date, dataProj1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# 3 - Create the PNG - plot 2 
globalActivePower <- as.numeric(dataProj1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")
dev.off()

# 4 - The PNG.file - plot2.png - is on the deafult directory
#********************** IMPORTANT NOTE ****************************
# My windows is in Portuguese, so when you saw "qui" or "sex" or sáb" understand, please, "Thu", "Fri" and "Sat"








 






