#Load data.table package
require(data.table)
# Read from the file.  NAs are encoded as "?", and only columns 1 and 3 are needed for plot 1.
data<-fread("./data/household_power_consumption.txt",na.strings="?",select=c(1,3))
# Select only those rows with the correct dates 
data<-data[Date=="1/2/2007"|Date=="2/2/2007"]
# Draw the histogram
hist(data[,Global_active_power],col="red",main="Global Active Power",xlab="Global active power (kilowats)")
# Save the plot as png
dev.copy(png, file = "plot1.png")
dev.off()