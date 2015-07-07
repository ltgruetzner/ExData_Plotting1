# load dplyr package
library(dplyr)
# load data, read necessary columns only
household<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?",
                      colClasses=c("character","NULL","numeric","NULL","NULL","NULL","NULL",
                                   "NULL","NULL"))
# use function "filter" from dlpyr package to select right dates
household<-filter(household, Date == "1/2/2007" | Date =="2/2/2007")
# create png file
png("plot1.png")
# plot histogram
hist(household$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", main="Global Active Power")
# close connection
dev.off()
