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
submeter1<-as.numeric(concerned[,7])
submeter2<-as.numeric(concerned[,8])
submeter3<-as.numeric(concerned[,9])
#plot
par(col="black")
png(filename="plot3.png",width=480,height=480)
plot(xaxis,submeter1,type="l",xlab="",ylab="Energy sub metering")
lines(xaxis,submeter2,col="red")
lines(xaxis,submeter3,col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()