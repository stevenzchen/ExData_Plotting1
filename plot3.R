# Read dataset and generate plot3 graph PNG.
# Steven Chen
plot3 <- function() {
    consumption <- read.csv("twoday.csv", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    dates <- strptime(paste(consumption$Date, consumption$Time), 
            "%d/%m/%Y %H:%M:%S")
    
    png("plot3.png")
    
    plot(dates, consumption$Sub_metering_1, 
            ylab = "Energy sub metering", 
            xlab = "", type = "l", col = "black")
    lines(dates, consumption$Sub_metering_2, col = "red")
    lines(dates, consumption$Sub_metering_3, col = "blue")
    
    legend("topright", 
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            col = c("black", "red", "blue"), lty = 1)
    
    dev.off()
}
