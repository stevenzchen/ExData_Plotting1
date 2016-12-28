# Read dataset and generate plot1 histogram PNG.
# Steven Chen
plot1 <- function() {
    consumption <- read.csv("twoday.csv", stringsAsFactors = FALSE, 
            colClasses = c("character", "character", rep("numeric", 7)))
    
    png("plot1.png")
    
    hist(consumption$Global_active_power, col = "red",
            main = "Global Active Power", 
            xlab = "Global Active Power (kilowatts)")
    
    dev.off()
}
