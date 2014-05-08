#read data
data<-read.table("household_power_consumption.txt",header=FALSE,na.strings="?",sep=";", colClasses = "character",skip=1)
#convert data of date
dateTime<-strptime(data[,1],"%d/%m/%Y")
#start end date
time1<-strptime("2007-02-01","%Y-%m-%d")
time2<-strptime("2007-02-02","%Y-%m-%d")
#get concerned data
pos<-dateTime==time1|dateTime==time2
Global_active_power<-data[,3]
gc<-as.numeric(Global_active_power[pos[!is.na(pos)]])
#plot
png(filename="plot1.png",width=480,height=480)
hist(gc,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")
dev.off()

