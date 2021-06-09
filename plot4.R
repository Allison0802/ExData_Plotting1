setwd("D:/Coursera/Data Science Math Skills/Exploratory Data Analysis with R/week 1 assignment")

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.string = "?", nrows = 2075259, stringsAsFactors= FALSE)
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
subdata$Date <- as.Date(subdata$Date, format = "%d/%m/%Y")
subdata$DateTime <- paste(subdata$Date, subdata$Time, sep = " ")
subdata$DateTime <- strptime(subdata$DateTime, "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2, 2), mar = c(4, 4, 1, 1), oma = c(0, 0, 1, 0))
with(subdata, {
  plot(DateTime, Global_active_power, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab="")
  plot(DateTime, Voltage, type = "l", ylab = "(Voltage(volt)", xlab = "")
  plot(DateTime,Sub_metering_1,  type = "l", ylab = "Global 
     Active Power (kilowatts)", xlab = "")
  lines(DateTime, Sub_metering_2, col = "Red")
  lines(DateTime, Sub_metering_3, col = "Blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 0.5, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", 
       ylab = "GLobal Reactive Power (kilowatts)", xlab = "")
})

dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()