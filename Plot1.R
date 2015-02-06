## loading dataset 
setwd("C://Users//Peter//Desktop//coursera//expl_data_an")
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##To date transformation
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

## subsetting
subset<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")

## building plot
hist(subset$Global_active_power,breaks=11,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")

##saving as png
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()