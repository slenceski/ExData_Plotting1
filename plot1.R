#Coursera Data Science Specialization
#Course 4 - Exploratory Data Analysis
#Project 1
#Script 1 - plot1.R
#obj: download data and create plot 1.png

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

png(file = "plot1.png", width = 480, height = 480, bg = "transparent")
with(data2day2, hist(Global_active_power, main = "Global Active Power", 
                     xlab = "Global Active Power (kilowatts)", col = "red"))

dev.off()



