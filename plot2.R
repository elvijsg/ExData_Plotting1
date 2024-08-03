#Load dplyr package
library(dplyr)

#Read data
data <- read.table("household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

#Add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

#Filter only the specific dates

filtered_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

#Create second plot

png(filename = "plot2.png", width = 480, height = 480)
plot(filtered_data$DateTime, filtered_data$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)")