# Script to read in data and plot for plot2

# read in data
tabledata <- read.csv("household_power_consumption.txt", sep=";", header=TRUE ,na.strings = "?", stringsAsFactors = FALSE)

#convert column time to date format
tabledata$Date <- strptime(tabledata$Date, format="%d/%m/%Y")

#subset data betweem 1/2/07 and 2/2/07
dt <- subset(tabledata, Date >= "2007-02-01" & Date <= ("2007-02-02"))

# we will now be working with Global_active_power. 
# Convert to numeric
dt$Global_active_power <- as.numeric(dt$Global_active_power)

#add date and time together
datetime <- paste(dt$Date, dt$Time)
#convert to date and time type
datetime <- as.POSIXct(datetime)

#ensure that there is only 1 space for graphs
par(mfrow=c(1,1))

#plot this line graph
#include border
plot(dt$Global_active_power~datetime,type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

#save to png
dev.copy(png, "plot2.png")
dev.off()
