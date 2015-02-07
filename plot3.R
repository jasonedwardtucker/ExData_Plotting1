library(sqldf)
library(lubridate)

file <- c("household_power_consumption.txt")
dataSubset <- read.csv.sql(file, header = TRUE, sep = ";", sql = 
                               "select * from file where (Date =='1/2/2007' OR Date == '2/2/2007')")
dataSubset$Date <- as.Date(dataSubset$Date, format = "%d/%m/%Y")
dataSubset$Time <- ymd_hms(paste(dataSubset$Date, dataSubset$Time, sep = " "))
png(filename = "plot3.png")
with(dataSubset, plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering"))
lines(dataSubset$Time, dataSubset$Sub_metering_2, col = "red")
lines(dataSubset$Time, dataSubset$Sub_metering_3, col = "blue")
legend("topright", lty=1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()