Sys.setlocale(category = "LC_ALL", locale = "C")
#read data
data<-read.table("household_power_consumption.txt",header=FALSE,na.strings="?",sep=";", colClasses = "character",skip=1)
#convert data of date
dateTime<-strptime(data[,1],"%d/%m/%Y")
#start end date
time1<-strptime("2007-02-01","%Y-%m-%d")
time2<-strptime("2007-02-02","%Y-%m-%d")
#get concerned data
pos<-dateTime==time1|dateTime==time2
concerned<-subset(data,pos)
xaxis<-as.POSIXct(paste(data[pos,1],concerned[,2]),format="%d/%m/%Y%H:%M:%S")
Global_active_power<-as.numeric(concerned[,3])
#plot
par(col="black")
png(filename="plot2.png",width=480,height=480)
plot(xaxis,Global_active_power,type="l",xlab="",ylab="Global_active_power(kilowatts)")
dev.off()