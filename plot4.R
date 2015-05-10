# This file should be inside directory containing the "exdata-data-household_power_consumption" directory

fulldata = read.table ("./exdata-data-household_power_consumption/household_power_consumption.txt" , sep = ";" , header = TRUE)
#Converting to Date format
fulldata$Date = as.Date (fulldata$Date , format = "%d/%m/%Y")
#Extracting Required Entries
data = fulldata[(fulldata$Date >="2007-02-01" & fulldata$Date<= "2007-02-02"),]
#Converting factor to numeric
data$Global_active_power = as.numeric (levels (data$Global_active_power)[data$Global_active_power])
data$Global_reactive_power = as.numeric (levels (data$Global_reactive_power)[data$Global_reactive_power])
data$Voltage  =as.numeric (levels(data$Voltage)[data$Voltage])
data$Sub_metering_1  =as.numeric (levels(data$Sub_metering_1)[data$Sub_metering_1])
data$Sub_metering_2  =as.numeric (levels(data$Sub_metering_2)[data$Sub_metering_2])
data$Sub_metering_3  =as.numeric (levels(data$Sub_metering_3)[data$Sub_metering_3])
#Converting character to Date Time format
datetime = paste (data$Date , data$Time)
data$datetime = strptime (datetime , format = "%Y-%m-%d %H:%M:%S")
#Initializing Plot
png ("./plot4.png" , width = 480 ,height =  480)
par(mfrow = c(2,2))
#Plotting
with (data , {
  plot (datetime , Global_active_power , type = "l" , ylab = "Global Active Power" , xlab = "")
})

with (data , {
  plot (datetime , Voltage , type = "l" , ylab = "VOltage" , xlab = "datetime")
})

with (data , {
  plot (datetime , Sub_metering_1 , type = "l" , xlab = "" , ylab = "Energy sub metering")
  lines (datetime , Sub_metering_2, col = "red")
  lines (datetime , Sub_metering_3, col = "blue")
  legend ("topright" , lty = "solid", col = c ("black", "red" , "blue") , legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ))
})


with (data , {
  plot (datetime , Global_reactive_power , type = "l" , ylab = "Global_reactive_power" , xlab = "datetime")
})

dev.off()
