library(dplyr)

data<-read.csv("household_power_consumption.txt",sep=';',na.strings="?")
png(file="plot2.png")
data2<- filter(tbl_df(data),Date=="1/2/2007" | Date=="2/2/2007")
gap<-data2$Global_active_power
wd<-strptime(paste(data2$Date,data2$Time), "%d/%m/%Y %H:%M:%S")
plot(wd,gap,type='l',ylab="Global Active Power(kilowatts)",xlab="",yaxt='n')
axis(side=2, at=c(0,2,4,6),labels=c("0","2","4","6"))
dev.off()
