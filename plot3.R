# Load the data
data<-fread("./data/household_power_consumption.txt",na.strings="?")
#Select only rows with correct date
data<-data[Date=="1/2/2007"|Date=="2/2/2007"]
# Create new DateTime column
data[,DateTime:=as.POSIXct(paste(data[,Date],data[,Time]),tz="",format="%d/%m/%Y %H:%M:%S")]
#Plot Sub_metering_1 against DateTime
with(data,plot(DateTime,Sub_metering_1,type="s",ylab="Energy sub metering",xlab=""))
#Add Sub_metering_2 to plot
with(data,lines(DateTime,Sub_metering_2,type="s",col="red"))
#Add Sub_metering_3 to plot
with(data,lines(DateTime,Sub_metering_3,type="s",col="blue"))
# Add legent to plot
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,cex=0.8)
#Save plot
dev.copy(png, file = "plot3.png")
dev.off()