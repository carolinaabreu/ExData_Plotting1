#Plot4.R

# Getting and organizing full dataset
fulldata<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date<-as.Date(data_full$Date, format="%d/%m/%Y")

# Subsetting the Course Project 1 Data
datacp1<-subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

# Converting dates
datetime<-paste(as.Date(datacp1$Date), datacp1$Time)
datacp1$Datetime<-as.POSIXct(datetime)

# Plot 4 - par plots
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datacp1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

# Saving Plot 4 to 480x480 png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
