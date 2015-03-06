library(dplyr)

data<-read.csv("household_power_consumption.txt",sep=';',na.strings="?")
png(file="plot3.png")
data2<- filter(tbl_df(data),Date=="1/2/2007" | Date=="2/2/2007")
sub1<-data2$Sub_metering_1
sub2<-data2$Sub_metering_2
sub3<-data2$Sub_metering_3
wd<-strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")
plot(wd,sub1,ylim=range(0,40),type='l',ylab="Energy sub metering",xlab="",yaxt='n')
points(wd,sub2,ylim=range(0,40),type='l',ylab="Energy sub metering",xlab="",yaxt='n',col="red")
points(wd,sub3,ylim=range(0,40),type='l',ylab="Energy sub metering",xlab="",yaxt='n',col="blue")
axis(side=2,at=c(0,10,20,30),ylim=range(0,30))
legend("topright", lty=c(1,1,1),col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
