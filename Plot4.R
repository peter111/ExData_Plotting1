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

## building plots
par(mfrow=c(2,2))
plot(a,subset$Global_active_power, xlab="",ylab="Global Active Power",type="l")
plot(a,subset$Voltage, xlab="datatime",ylab="Voltage",type="l")

plot(a,subset$Sub_metering_1, ylab="Energy sub metering",type="l",xlab="")
lines(a,subset$Sub_metering_2, col="red")
lines(a,subset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lwd=1,x.intersp=1,y.intersp=1,cex=0.8,bty="n")
plot(a,subset$Global_reactive_power,ylab="Global_reactive_power", xlab="datatime",type="l")

##saving as png
dev.copy(png,'plot4.png',width=480,height=480,units="px", type="cairo-png",antialias="subpixel")
dev.off()
