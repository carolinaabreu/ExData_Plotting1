#Plot3.R

# Getting and organizing full dataset
fulldata<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date<-as.Date(data_full$Date, format="%d/%m/%Y")

# Subsetting the Course Project 1 Data
datacp1<-subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

# Converting dates
datetime<-paste(as.Date(datacp1$Date), datacp1$Time)
datacp1$Datetime<-as.POSIXct(datetime)

# Plot 3 - Sub_metering
with(datacp1, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving Plot 3 to 480x480 png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
