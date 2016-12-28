# Read dataset and generate plot2 graph PNG.
# Steven Chen
plot2 <- function() {
    consumption <- read.csv("twoday.csv", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    dates <- strptime(paste(consumption$Date, consumption$Time), 
            "%d/%m/%Y %H:%M:%S")
    
    png("plot2.png")
    
    plot(dates, consumption$Global_active_power, 
            ylab = "Global Active Power (kilowatts)", 
            xlab = "", type = "l")
    
    dev.off()
}
