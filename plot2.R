#Load the data (columns 1 to 3 needed), identifying "?" strings as NAs
data<-fread("./data/household_power_consumption.txt",na.strings="?",select=1:3)
#Select only rows with correct date
data<-data[Date=="1/2/2007"|Date=="2/2/2007"]
# Create new DateTime column
data[,DateTime:=as.POSIXct(paste(data[,Date],data[,Time]),tz="",format="%d/%m/%Y %H:%M:%S")]
# Plot the data
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowats)",xlab=""))
# Save the plot as png
dev.copy(png, file = "plot2.png")
dev.off()