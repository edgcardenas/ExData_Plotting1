datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
Voltage <- as.numeric(SubSetData$Voltage)

SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()