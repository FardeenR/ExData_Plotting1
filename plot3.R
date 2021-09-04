library(chron)
data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- times(data$Time)

##Select data for 2007-02-01 to 2007-02-02 only. Set Global_active_power as numeric

selected_data <- subset(data, data$Date >= "2007-02-01" & data$Date <="2007-02-02")
selected_data$Global_active_power <- as.numeric(selected_data$Global_active_power)

##Merge Date and Time and set the correct class

selected_data$DateTime <- paste(selected_data$Date, selected_data$Time)
selected_data$DateTime <- strptime(selected_data$DateTime, format = "%Y-%m-%d %H:%M:%S")

##Create png file and plot the graph

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(selected_data, plot(DateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(selected_data$DateTime, selected_data$Sub_metering_2, col="red")
lines(selected_data$DateTime, selected_data$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black", "red","blue"), lty=1)
dev.off()