#Load the data
data<-fread("./data/household_power_consumption.txt",na.strings="?")
#Select only rows with correct date
data<-data[Date=="1/2/2007"|Date=="2/2/2007"]
# Create new DateTime column
data[,DateTime:=as.POSIXct(paste(data[,Date],data[,Time]),tz="",format="%d/%m/%Y %H:%M:%S")]
#Set up a png file to save to (using dev.copy caused problems with this plot)
png(filename = "plot4.png")
# Set up a 2 by 2 array of plots
par(mfrow=c(2,2))
# Draw first plot 
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowats)",xlab=""))
# Second plot
with(data,plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime"))
# Third Plot
#Plot Sub_metering_1 against DateTime
with(data,plot(DateTime,Sub_metering_1,type="s",ylab="Energy sub metering",xlab=""))
#Add Sub_metering_2 to plot
with(data,lines(DateTime,Sub_metering_2,type="s",col="red"))
#Add Sub_metering_3 to plot
with(data,lines(DateTime,Sub_metering_3,type="s",col="blue"))
# Add legent to third plot
legend("topright",legend=c("Sub metering 1","Sub_metering_2","Sub metering_3"),col=c("black","red","blue"),lty=1,cex=0.8)
# Fourth plot
with(data,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))
# Close graphics device
dev.off()


