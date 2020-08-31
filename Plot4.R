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
datetime <- strptime(paste(datatimeframe$Date, datatimeframe$Time, sep=" "), 
                     "%d/%m/%Y %H:%M:%S") 

par(mfrow = c(2, 2)) 
# First plot
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# Third plot

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=0.5, col=c("black", "red", "blue"))

# Fourth plot
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.2)

##Saving Plot4. time series in R
dev.copy(png,"plot4.png", width=480, height=480)
dev.off()
