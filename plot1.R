fh <- file("household_power_consumption.txt")
ba <- read.table(fh, sep = ";", header = TRUE)
# convert date and time from factor to date and character
ba$Date <- as.Date(ba$Date, format = "%d/%m/%Y")
ba$Time <- format(strptime(ba$Time, "%H:%M:%S"),"%H:%M:%S")

# Subset 2 days of data
data <-ba[(ba$Date > "2007-01-31" & ba$Date < "2007-02-03"),]
data$Global_active_power <- as.character(data$Global_active_power)
data$Global_active_power <- as.numeric(data$Global_active_power)
# Generating Plot 1
png("plot1.png",width=480,height=480)
hist(data$Global_active_power,xlab="Global Active Power (kilowatts)", main="Global Active Power",c="red")
dev.off()