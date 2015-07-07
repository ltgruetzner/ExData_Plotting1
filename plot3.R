# load dplyr package
library(dplyr)
# load data, read necessary columns only
household<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                      colClasses=c("character","character","NULL","NULL","NULL","NULL","numeric",
                                   "numeric","numeric"))
# use function "filter" from dlpyr package to select right dates
household<-filter(household, Date == "1/2/2007" | Date =="2/2/2007")
# combine Date and Time columns and assign POSICct class
household$Date<-as.Date(household$Date, "%d/%m/%Y")
household$Date2 <- paste(household$Date, household$Time)
household$Date2<-as.POSIXct(household$Date2) 

# create png file
png("plot3.png")
# create plot
plot(household$Date2,household$Sub_metering_1 , 
     xlab="",ylab="Energy sub metering", main="", type="l")
# add points and legend to plot
points(household$Date2,household$Sub_metering_2, col="red", type="l")
points(household$Date2,household$Sub_metering_3, col="blue", type="l")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1), col=c("black", "red","blue"))
# close connection
dev.off()
