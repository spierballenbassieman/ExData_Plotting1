
filename <- "project_exploratory_data_1.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, filename)
}  

if (!file.exists("household_power_consumption.txt")) {
  unzip(filename)
}

features <- data.table::fread("household_power_consumption.txt")

features <- subset(features, Date == "1/2/2007" | Date == "2/2/2007")

features$Global_active_power <- as.numeric(features$Global_active_power)

png("plot1.png", width=480, height=480)

hist(features$Global_active_power, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts")

dev.off()


