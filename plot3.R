datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

SubMetering1 <- as.numeric(SubSetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubSetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()