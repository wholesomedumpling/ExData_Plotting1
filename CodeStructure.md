# Code Structure
##### By: Tiffany Gregory


### Plot 1
1. Download zip data and read the internal file into a temporary file. Once this is done, store the data in tabledata and unload the temp file.
2. Convert Date in tabledata to date class.
3. Subset the data to read the data between the dates "2007-02-01" & "2007-02-02" and store in dt.
4. Convert global_active_power into a numeric class.
5. Ensure that the space for plotting is only 1 x 1
6. Plot the histogram with the following parameters:
        + Histogram using Global_active_power
        + Colour = red
        + x axis label = Global Active Power (kilowatts)
        + y axis label = Frequency
        + Title = Global Active Power
7. Copy the graph into a png. Turn dev off.

### Plot 2
1. Download zip data and read the internal file into a temporary file. Once this is done, store the data in tabledata and unload the temp file.
2. Convert Date in tabledata to date class.
3. Subset the data to read the data between the dates "2007-02-01" & "2007-02-02" and store in dt.
4. Convert global_active_power into a numeric class.
5. Add date and time together. Convert to POSIXct.
6. Ensure that the space for plotting is only 1 x 1
7. Plot the graph with the following parameters:
        + Plot Global_active_power dependent on date & time
        + Colour = red
        + y axis label = Global Active Power (kilowatts)
        + x axis label = blank
8. Copy the graph into a png. Turn dev off.

### Plot 3
1. Download zip data and read the internal file into a temporary file. Once this is done, store the data in tabledata and unload the temp file.
2. Convert Date in tabledata to date class.
3. Subset the data to read the data between the dates "2007-02-01" & "2007-02-02" and store in dt.
4. Convert the sub_metering columns into a numeric class.
5. Add date and time together. Convert to POSIXct.
6. Ensure that the space for plotting is only 1 x 1
7. Plot the graph with the following parameters:  
        + Plot Global_active_power dependent on date & time  
        + y axis label = Energy sub metering  
        + x axis label = blank  
        + Set the plot with the first sub_metering.  
        + Add in sub_metering_2, colour = red  
        + Add in sub_metering_3, colour = blue  
        + Add in the legend to the topright  
8. Copy the graph into a png. Turn dev off.

### Plot 4
1. Download zip data and read the internal file into a temporary file. Once this is done, store the data in tabledata and unload the temp file.
2. Convert Date in tabledata to date class.
3. Subset the data to read the data between the dates "2007-02-01" & "2007-02-02" and store in dt.
4. Convert the sub_metering columns into a numeric class.
5. Add date and time together. Convert to POSIXct.
6. Ensure that the space for plotting is only 2 x 2
7. Plot plot2.
8. Plot Voltage as a dependent on time
9. Plot plot3.
10. Plot Global_reactive_power as a dependent on time.
11. Save to png and turn dev off.


