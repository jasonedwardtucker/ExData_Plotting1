library(sqldf)
library(lubridate)

file <- c("household_power_consumption.txt")
dataSubset <- read.csv.sql(file, header = TRUE, sep = ";", sql = 
                               "select * from file where (Date =='1/2/2007' OR Date == '2/2/2007')")
dataSubset$Date <- as.Date(dataSubset$Date, format = "%d/%m/%Y")
dataSubset$Time <- ymd_hms(paste(dataSubset$Date, dataSubset$Time, sep = " "))
png(filename = "plot2.png")
with(dataSubset, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.off()