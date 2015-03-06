library(dplyr)
png(file="plot4.png")
par(mfrow=c(2,2))
data<-read.csv("household_power_consumption.txt",sep=';',na.strings="?")
data2<- filter(tbl_df(data),Date=="1/2/2007" | Date=="2/2/2007")
gap<-data2$Global_active_power
plot(wd,gap,type='l',ylab="Global Active Power(kilowatts)",xlab="",yaxt='n')
axis(side=2, at=c(0,2,4,6),labels=c("0","2","4","6"))

plot(wd,data2$Voltage,type='l',ylab="Global Active Power(kilowatts)",xlab="datetime",yaxt='n')
axis(side=2, at=c(234,236,238,240,242,244,246),labels=c("234","","238","","242","","246"))



sub1<-data2$Sub_metering_1
sub2<-data2$Sub_metering_2
sub3<-data2$Sub_metering_3
wd<-strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")
plot(wd,sub1,ylim=range(0,40),type='l',ylab="Energy sub metering",xlab="",yaxt='n')
points(wd,sub2,ylim=range(0,40),type='l',ylab="Energy sub metering",xlab="",yaxt='n',col="red")
points(wd,sub3,ylim=range(0,40),type='l',ylab="Energy sub metering",xlab="",yaxt='n',col="blue")
axis(side=2,at=c(0,10,20,30),ylim=range(0,30))
legend("topright", lty=c(1,1,1),col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(wd,data2$Global_reactive_power,ylim=range(0,0.5),type='l',ylab="Global_reactive_power",xlab="datetime",yaxt='n')
axis(side=2,at=c(0,0.1,0.2,0.3,0.4,0.5),ylim=range(0,0.5))

dev.off()
