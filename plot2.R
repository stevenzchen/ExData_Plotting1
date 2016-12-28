# Read dataset and generate plot2 graph PNG.
# Steven Chen
plot2 <- function() {
    consumption <- read.delim("household_power_consumption.txt", 
            sep = ";", na.strings = "?", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    indices <- consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"
    activePower = consumption$Global_active_power[indices]
    
    dates <- strptime(paste(consumption$Date[indices], 
            consumption$Time[indices]), "%d/%m/%Y %H:%M:%S")
    
    png("plot2.png")
    
    plot(dates, activePower, ylab = "Global Active Power (kilowatts)", 
            xlab = "", type = "l")
    
    dev.off()
}
