# Read dataset and generate plot4 graphs PNG.
# Steven Chen
plot4 <- function() {
    consumption <- read.csv("twoday.csv", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    dates <- strptime(paste(consumption$Date, consumption$Time), 
            "%d/%m/%Y %H:%M:%S")
    
    png("plot4.png")
    
    par(mfrow = c(2, 2))
    
    plot(dates, consumption$Global_active_power, ylab = "Global Active Power", 
            xlab = "", type = "l")
    
    plot(dates, consumption$Voltage, ylab = "Voltage", xlab = "datetime", 
            type = "l")
    
    plot(dates, consumption$Sub_metering_1, 
            ylab = "Energy sub metering", 
            xlab = "", type = "l", col = "black")
    lines(dates, consumption$Sub_metering_2, col = "red")
    lines(dates, consumption$Sub_metering_3, col = "blue")
    
    legend("topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"), lty = 1, bty = "n")
    
    plot(dates, consumption$Global_reactive_power, xlab = "datetime", 
            ylab = "Global_reactive_power", type = "l")
    
    dev.off()
}
