
filename <- "project_exploratory_data_1.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename)
}  

if (!file.exists("household_power_consumption.txt")) {
  unzip(filename)
}

data2 <- data.table::fread("household_power_consumption.txt") #,  sep=";", stringsAsFactors=FALSE, dec=".")

data3 <- subset(data2, Date == "1/2/2007" | Date == "2/2/2007")

Sys.setlocale("LC_ALL", "English")

data3$timedate <- as.POSIXct(paste(data3$Date, " ", data3$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)

with(data3, plot(timedate, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
title(main="Global Active Vs Time")

dev.off()


