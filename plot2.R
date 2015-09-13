#Plot2.R

# Getting and organizing full dataset
fulldata<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date<-as.Date(data_full$Date, format="%d/%m/%Y")

# Subsetting the Course Project 1 Data
datacp1<-subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

# Converting dates
datetime<-paste(as.Date(datacp1$Date), datacp1$Time)
datacp1$Datetime<-as.POSIXct(datetime)

# Plot 2 - "Global Active Power" kilowatts
plot(datacp1$Global_active_power~datacp1$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")

# Saving Plot 2 to 480x480 png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
