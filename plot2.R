# Script to read in data and plot for plot2

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
