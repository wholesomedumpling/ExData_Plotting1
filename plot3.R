# Script to read in data and plot for plot3

#download zipped file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
#unzip file and read in data
tabledata <- read.table(unz(temp, "household_power_consumption.txt"),sep=";", 
                        header=TRUE ,na.strings = "?",stringsAsFactors = FALSE)
unlink(temp)


#convert column time to date format
tabledata$Date <- strptime(tabledata$Date, format="%d/%m/%Y")

#subset data betweem 1/2/07 and 2/2/07
dt <- subset(tabledata, Date >= "2007-02-01" & Date <= ("2007-02-02"))

# we will now be working with the three sub meterings. 
# Convert to numeric
dt$Sub_metering_1 <- as.numeric(dt$Sub_metering_1)
dt$Sub_metering_2 <- as.numeric(dt$Sub_metering_2)
dt$Sub_metering_3 <- as.numeric(dt$Sub_metering_3)

#add date and time together
datetime <- paste(dt$Date, dt$Time)
#convert to date and time type
datetime <- as.POSIXct(datetime)

#ensure that there is only 1 space for graphs
par(mfrow=c(1,1))

#plot this line graph
#include border
plot(dt$Sub_metering_1 ~ datetime,type="l",ylab="Energy sub metering", xlab="")
#add in second line
lines(dt$Sub_metering_2 ~ datetime, type = "l", col = "red")
#add in third line
lines(dt$Sub_metering_3 ~ datetime, type = "l", col = "blue")

#add in the legend
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"),lty=1, lwd=2)

#save to png
dev.copy(png, "plot3.png")
dev.off()
