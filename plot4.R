#Coursera Data Science Specialization
#Course 4 - Exploratory Data Analysis
#Project 1
#Script 4 - plot4.R
#obj: download data and create plot 4.png

##Load Data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("project1data.zip")) {
  download.file(url,destfile = "project1data.zip")
} else print("File already downloaded")

if(!file.exists("project1data.zip")) {
  unzip("project1data.zip", exdir = "data1")
} else print("File already unzipped")

data <- read.table(file = "data1/household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?")

#subsetdata
data2day <- subset(data, data$Date == "2/2/2007" | data$Date == "1/2/2007")

#Adjust date-time class
dateTime <- paste(data2day$Date,data2day$Time)
dateTime <- strptime(dateTime, "%e/%m/%Y %H:%M:%S")
data2day2 <- cbind(dateTime, data2day)

#Construct Plot
##width 480 pixels x Height 480 pixels

png(file = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfcol =c(2,2))
#plot top left
plot(data2day2$dateTime, data2day2$Global_active_power, 
     ylab = "Global Active Power",
     xlab = "", type = "l")
#plot bottom left
plot(data2day2$dateTime, data2day2$Sub_metering_1, 
     ylab = "Energy sub metering", xlab = "", type = "n")
lines(data2day2$dateTime, data2day2$Sub_metering_1, col = "black")
lines(data2day2$dateTime, data2day2$Sub_metering_2, col = "red")
lines(data2day2$dateTime, data2day2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1) 
#plot top right
plot(data2day2$dateTime, data2day2$Voltage, ylab = "Voltage", 
     xlab = "datetime", type = "l")
#plot bottom right
plot(data2day2$dateTime, data2day2$Global_reactive_power, 
     ylab = "Global_reactive_power", xlab = "datetime", type = "l")
dev.off()