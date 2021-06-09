setwd("D:/Coursera/Data Science Math Skills/Exploratory Data Analysis with R/week 1 assignment")

data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", 
                 na.string = "?", nrows = 2075259)
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
png("plot1.png", width = 480, height = 480)
hist(subdata$Global_active_power, main = "Global Active Power", xlab = "Global 
     Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
