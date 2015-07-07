# load dplyr package
library(dplyr)
# load data, read necessary columns only
household<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                      colClasses=c("character","character","numeric","numeric","numeric","NULL","numeric",
                                   "numeric","numeric"))
# use function "filter" from dlpyr package to select right dates
household<-filter(household, Date == "1/2/2007" | Date =="2/2/2007")
# combine Date and Time columns and assign POSICct class
household$Date<-as.Date(household$Date, "%d/%m/%Y")
household$Date2 <- paste(household$Date, household$Time)
household$Date2<-as.POSIXct(household$Date2) 
# set parameters for 2x2 plot
par(mfrow=c(2,2))

# create png file
png("plot4.png")
par(mfrow=c(2,2))

# plot first plot
plot(household$Date2, household$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")
     
# plot second plot
plot(household$Date2,household$Voltage, main="", type="l", xlab="datetime", ylab="Voltage")

# plot third plot
plot(household$Date2,household$Sub_metering_1 , 
     xlab="",ylab="Energy sub metering", main="", type="l")
# add points and legend to plot
points(household$Date2,household$Sub_metering_2, col="red", type="l")
points(household$Date2,household$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red","blue"), box.lwd = 0)
       
# plot fourth plot
plot(household$Date2,household$Global_reactive_power, main="", type="l", 
     xlab="datetime", ylab="Global_reactive_power")
# close connection
dev.off()

