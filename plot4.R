# Script to read in data and plot for plot4
# read in data
###tabledata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE ,na.strings = "?", stringsAsFactors = FALSE)

#convert column time to date format
###tabledata$Date <- strptime(tabledata$Date, format="%d/%m/%Y")

#subset data betweem 1/2/07 and 2/2/07
###dt <- subset(tabledata, Date >= "2007-02-01" & Date <= ("2007-02-02"))

# we will now be working with the three sub meterings. 
# Convert to numeric
###dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
###dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
###dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)
###dt$Global_active_power <- as.numeric(dt$Global_active_power)
###dt$Voltage <- as.numeric(dt$Voltage)
###dt$Global_reactive_power <- as.numeric((dt$Global_reactive_power))

#add in multiple graphing windows
par(mfrow=c(2,2))

#add date and time together
datetime <- paste(dt$Date, dt$Time)
#convert to date and time type
datetime <- as.POSIXct(datetime)

#plot first graph
plot(dt$Global_active_power~datetime,type="l", 
     ylab = "Global Active Power", xlab = "")


#plot second graph

plot(dt$Voltage~datetime,type = "l", xlab = "", ylab = "Voltage")

#plot third graph
#include border
plot(dt$Sub_metering_1 ~ datetime,type="l",ylab="Energy sub metering", xlab="")
#add in second line
lines(dt$Sub_metering_2 ~ datetime, type = "l", col = "red")
#add in third line
lines(dt$Sub_metering_3 ~ datetime, type = "l", col = "blue")

#add in the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=1, lwd=2, cex = 0.7, bty="n")

#plot fourth graph

plot(dt$Global_reactive_power~datetime,type="l", ylab = "Global_reactive_power")

#save to png
dev.copy(png, "plot4.png")
dev.off()
