#Load dplyr package
library(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

#Add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

#Filter only the specific dates

filtered_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#Create last (4th) plot

png(filename = "plot4.png", width = 480, height = 480)
par(mfcol = c(2, 2))

#Top left plot
plot(filtered_data$DateTime, filtered_data$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")

#Bottom left plot
plot(filtered_data$DateTime, filtered_data$Sub_metering_1, type="l", xlab = NA, ylab = "Energy sub metering")
lines(filtered_data$DateTime, filtered_data$Sub_metering_2, type="l", col = "red")
lines(filtered_data$DateTime, filtered_data$Sub_metering_3, type="l", col = "blue")
legend("topright", legend = c(names(filtered_data)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8, bty = "n")

#Top right plot
plot(filtered_data$DateTime, filtered_data$Voltage, type="l", xlab = "datetime", ylab = "Voltage")

#Bottom right plot
plot(filtered_data$DateTime, filtered_data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power")