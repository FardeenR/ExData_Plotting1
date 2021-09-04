##Download the file

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "Course4Wk1.zip", method="curl")
unzip("Course4Wk1.zip")

##Read the file and set the format of Date and Time correctly

library(chron)
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- times(data$Time)

##Select data for 2007-02-01 to 2007-02-02 only. Set Global_active_power as numeric

selected_data <- subset(data, data$Date >= "2007-02-01" & data$Date <="2007-02-02")
selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)

##Open png file and plot the histogram

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(selected_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()