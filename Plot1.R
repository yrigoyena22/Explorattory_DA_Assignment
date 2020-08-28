##Peer-graded Assignment: Course Project 1
##This assignment uses data from the UC Irvine Machine Learning 
##Repository, a popular repository for machine learning datasets.
##In particular, we will be using the "Individual household electric 
##power consumption Data Set" which I have made available on the 
##course web site:Dataset: Electric power consumption [20Mb]
##Description: Measurements of electric power consumption in one
##household with a one-minute sampling rate over a period of almost 
##4 years. Different electrical quantities and some sub-metering values 
##are available.
## Solution
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
summary(data)
datatimeframe <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(datatimeframe$Global_active_power)
globalReactivePower <- as.numeric(datatimeframe$Global_reactive_power)
voltage <- as.numeric(datatimeframe$Voltage)
subMetering1 <- as.numeric(datatimeframe$Sub_metering_1)
subMetering2 <- as.numeric(datatimeframe$Sub_metering_2)
subMetering3 <- as.numeric(datatimeframe$Sub_metering_3)

hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

##Saving Plot1 in R
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()