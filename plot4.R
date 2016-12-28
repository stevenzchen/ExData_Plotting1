# Read dataset and generate plot4 graphs PNG.
# Steven Chen
plot4 <- function() {
    consumption <- read.delim("household_power_consumption.txt", 
            sep = ";", na.strings = "?", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    indices <- consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"
    
    dates <- strptime(paste(consumption$Date[indices], 
        consumption$Time[indices]), "%d/%m/%Y %H:%M:%S")
    activePower = consumption$Global_active_power[indices]
    
    png("plot4.png")
    
    par(mfrow = c(2, 2))
    
    plot(dates, activePower, ylab = "Global Active Power", 
            xlab = "", type = "l")
    
    plot(dates, consumption$Voltage[indices], ylab = "Voltage", xlab = "datetime", 
            type = "l")
    
    plot(dates, consumption$Sub_metering_1[indices], 
            ylab = "Energy sub metering", 
            xlab = "", type = "l", col = "black")
    lines(dates, consumption$Sub_metering_2[indices], col = "red")
    lines(dates, consumption$Sub_metering_3[indices], col = "blue")
    
    legend("topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"), lty = 1, bty = "n")
    
    plot(dates, consumption$Global_reactive_power[indices], xlab = "datetime", 
            ylab = "Global_reactive_power", type = "l")
    
    dev.off()
}
