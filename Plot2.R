## loading dataset 
setwd("C://Users//Peter//Desktop//coursera//expl_data_an")
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

##To date transformation
data$Date<-as.Date(data$Date,format="%d/%m/%Y")

## subsetting
subset<-subset(data,Date=="2007-02-01" | Date=="2007-02-02")

##To time and date transformation
x<-paste(subset$Date,subset$Time)
a<-strptime(x,format="%Y-%m-%d %H:%M:%S")


## building plot
plot(a,subset$Global_active_power, xlab="",ylab="Global Active Power (kilowatts)",type="l")


##saving as png
dev.copy(png,'plot2.png',width=480,height=480)
dev.off()