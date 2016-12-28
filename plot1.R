# Read dataset and generate plot1 histogram PNG.
# Steven Chen
plot1 <- function() {
    consumption <- read.delim("household_power_consumption.txt", 
            sep = ";", na.strings = "?", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    indices <- consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007"
    activePower = consumption$Global_active_power[indices]
    
    png("plot1.png")
    
    hist(activePower, col = "red", main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)")
    
    dev.off()
}
