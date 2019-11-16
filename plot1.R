# Script to read in data and plot for plot1

# read in data - no factors
tabledata <- read.table("household_power_consumption.txt", sep=";", header=TRUE ,na.strings = "?",stringsAsFactors = FALSE)

#convert column time to date format
tabledata$Date <- strptime(tabledata$Date, format="%d/%m/%Y")

#subset data betweem 1/2/07 and 2/2/07
dt <- subset(tabledata, Date >= "2007-02-01" & Date <= ("2007-02-02"))

# we will now be working with Global_active_power. 
# Convert to numeric
dt$Global_active_power <- as.numeric(dt$Global_active_power)

#ensure that there is only 1 space for graphs
par(mfrow=c(1,1))

#plot the histogram with the following information:
        #col = red; correct labels;title = Global Active Power
hist(dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     ylab ="Frequency", main = "Global Active Power")

#save to png
dev.copy(png, "plot1.png")
dev.off()