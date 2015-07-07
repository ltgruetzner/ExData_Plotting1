# load dplyr package
library(dplyr)
# load data, read necessary columns only
household<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                      colClasses=c("character","character","numeric","NULL","NULL","NULL","NULL",
                                   "NULL","NULL"))
# use function "filter" from dlpyr package to select right dates
household<-filter(household, Date == "1/2/2007" | Date =="2/2/2007")
# combine Date and Time columns and assign POSICct class
household$Date<-as.Date(household$Date, "%d/%m/%Y")
household$Date2 <- paste(household$Date, household$Time)
household$Date2<-as.POSIXct(household$Date2) 
# create png file
png("plot2.png")
# create plot
plot(household$Date2, household$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
# close connection
dev.off()
