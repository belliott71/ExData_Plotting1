fh <- file("household_power_consumption.txt")
ba <- read.table(fh, sep = ";", header = TRUE)
#Convert Date and time from factor
ba$Date <- as.Date(ba$Date, format = "%d/%m/%Y")
ba$Time <- format(strptime(ba$Time, "%H:%M:%S"),"%H:%M")

# Subset two days of data

data <-ba[(ba$Date > "2007-01-31" & ba$Date < "2007-02-03"),]
datetime <- paste(data$Date,data$Time)
data$datetime <- as.POSIXct(datetime)
#Convert glabal active power, Sub_metering to numeric
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.character(data$Global_reactive_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.character(data$Sub_metering_1)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.character(data$Sub_metering_2)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.character(data$Sub_metering_3)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.character(data$Voltage)
data$Voltage <- as.numeric(data$Voltage)
#Plot Data
png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(
    data$datetime,
    data$Global_active_power,
    xlab ="",
    ylab = "Global Active Power",
    type ="l"
)

plot(
    data$datetime,
    data$Voltage,
    xlab ="datetime",
    ylab = "Voltage",
    type ="l"
)

plot(
    data$datetime,
    data$Sub_metering_1,
    xlab ="",
    ylab = "Energy sub metering",
    type ="l",
    col = 'black'
)
lines( data$datetime, data$Sub_metering_2, col = "red")
lines( data$datetime, data$Sub_metering_3, col = "blue")

legend(
    'topright', 
    c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
    col = c('black','red','blue'),
    lty = 1,
    lwd = 3
)

plot(
    data$datetime,
    data$Global_reactive_power,
    xlab ="datetime",
    ylab = "Global_reactive_power",
    type ="l"
)
dev.off()

