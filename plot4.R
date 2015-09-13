## Coursera - Exploratory Data - 032 - September 2015
## Projet1 - Plot4
## Source of data for this project: UC Irvine Machine Learning Repository
## URL: https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption 

## This project Rscript does the following:

# 1 - Reads the data at csv.file
dataFile <- "./data/household_power_consumption.txt"
data <- read.csv(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# 2 - Prepare data for the projetc1
dataProj1 <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(dataProj1$Date, dataProj1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
ActivePower <- as.numeric(dataProj1$Global_active_power)
ReactivePower <- as.numeric(dataProj1$Global_reactive_power)
voltage <- as.numeric(dataProj1$Voltage)
subMetering1 <- as.numeric(dataProj1$Sub_metering_1)
subMetering2 <- as.numeric(dataProj1$Sub_metering_2)
subMetering3 <- as.numeric(dataProj1$Sub_metering_3)

# 3 - Create the PNG - plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
 
plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()

# 4 - The PNG.file - plot4.png - is on the deafult directory
#********************** IMPORTANT NOTE ****************************
# My windows is in Portuguese, so when you saw "qui" or "sex" or sáb" understand, please, "Thu", "Fri" and "Sat".





