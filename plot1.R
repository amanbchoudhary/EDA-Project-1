# This file should be inside directory containing the "exdata-data-household_power_consumption" directory

fulldata = read.table ("./exdata-data-household_power_consumption/household_power_consumption.txt" , sep = ";" , header = TRUE)
fulldata$Date = as.Date (fulldata$Date , format = "%d/%m/%Y")
data = fulldata[(fulldata$Date >="2007-02-01" & fulldata$Date<= "2007-02-02"),]
data$Global_active_power = as.numeric (levels (data$Global_active_power)[data$Global_active_power])
png ("./plot1.png" , width = 480 ,height =  480)
with (data , hist (Global_active_power , col ="red" , xlab = "Global Active Power (kilowatts)" , ylab = "Frequency" , main = "Global Active Power"))
dev.off()