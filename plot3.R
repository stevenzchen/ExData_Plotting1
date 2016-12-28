# Read dataset and generate plot3 graph PNG.
# Steven Chen
plot3 <- function() {
    consumption <- read.delim("household_power_consumption.txt", 
            sep = ";", na.strings = "?", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    indices <- consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"
    
    dates <- strptime(paste(consumption$Date[indices], 
                            consumption$Time[indices]), "%d/%m/%Y %H:%M:%S")
    
    png("plot3.png")
    
    plot(dates, consumption$Sub_metering_1[indices], 
            ylab = "Energy sub metering", 
            xlab = "", type = "l", col = "black")
    lines(dates, consumption$Sub_metering_2[indices], col = "red")
    lines(dates, consumption$Sub_metering_3[indices], col = "blue")
    
    legend("topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"), lty = 1)
    
    dev.off()
}
