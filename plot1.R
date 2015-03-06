library(dplyr)
#library(sqldf)

#Read the entire data set from file into df
data<-read.csv("household_power_consumption.txt",sep=';',na.strings="?")
#data<-read.csv.sql("household_power_consumption.txt","select * from file where Date==1/2/2007 OR Date == 2/2/2007")
#Initialize output file
png(file="plot1.png")
#Filter the data for given data
data2<- filter(tbl_df(data),Date=="1/2/2007" | Date=="2/2/2007")

#Create histogram
bins<-seq(0,8,by=0.5)
hist(data2$Global_active_power,col="red",ylim=range(0,1200),xlim=range(0,6),
     breaks=bins,xlab="Global Active Power(kilowatts)",main="Global Active Power",xaxt='n',yaxt='n')
axis(side=1, at=c(0,2,4,6))
axis(side=2, at=c(0,200,400,600,800,1000,1200),labels=c(0,200,400,600,800,1000,1200))
dev.off()
