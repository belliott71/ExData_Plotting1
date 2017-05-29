fh <- file("household_power_consumption.txt")
ba <- read.table(fh, sep = ";", header = TRUE)
#Convert Date and time from factor
ba$Date <- as.Date(ba$Date, format = "%d/%m/%Y")
ba$Time <- format(strptime(ba$Time, "%H:%M:%S"),"%H:%M")

# Subset two days of data

data <-ba[(ba$Date > "2007-01-31" & ba$Date < "2007-02-03"),]
datetime <- paste(data$Date,data$Time)
data$datetime <- as.POSIXct(datetime)
#Convert glabal active power to numeric
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
#Plot Data
png("plot2.png",width=480,height=480)
plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()

