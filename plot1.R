#Plot1.R

# Getting and organizing full dataset
fulldata<-read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fulldata$Date<-as.Date(data_full$Date, format="%d/%m/%Y")
  
# Subsetting the Course Project 1 Data
datacp1<-subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(fulldata)

# Converting dates
datetime<-paste(as.Date(datacp1$Date), datacp1$Time)
datacp1$Datetime<-as.POSIXct(datetime)

# Plot 1 - "Global Active Power" Red Bar Histogram
hist(datacp1$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving Plot 1 to 480x480 png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
