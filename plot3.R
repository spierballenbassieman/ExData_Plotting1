
Sys.setlocale("LC_ALL", "English")

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


data3$timedate <- as.POSIXct(paste(data3$Date, " ", data3$Time), format = "%d/%m/%Y %H:%M:%S")


png("plot3.png", width=480, height=480)


with(data3, plot(timedate, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(data3, lines(timedate, Sub_metering_2, col = "red"))
with(data3, lines(timedate, Sub_metering_3, col = "blue"))
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1)
title(main="Energy sub-metering")


dev.off()

