# This file should be inside directory containing the "exdata-data-household_power_consumption" directory

fulldata = read.table ("./exdata-data-household_power_consumption/household_power_consumption.txt" , sep = ";" , header = TRUE)
#Converting to Date format
fulldata$Date = as.Date (fulldata$Date , format = "%d/%m/%Y")
#Extracting Required Entries
data = fulldata[(fulldata$Date >="2007-02-01" & fulldata$Date<= "2007-02-02"),]
#Converting factor to numeric
data$Global_active_power = as.numeric (levels (data$Global_active_power)[data$Global_active_power])
#Converting character to Date Time format
datetime = paste (data$Date , data$Time)
data$datetime = strptime (datetime , format = "%Y-%m-%d %H:%M:%S")
#Initializing Plot
png ("./plot2.png" , width = 480 ,height =  480)

#Plotting

with (data , {
  plot (datetime , Global_active_power , type = "n" , ylab = "Global Active Power (kilowatts)" , xlab = "")
  lines (datetime , Global_active_power)
})

#Turning off
dev.off()