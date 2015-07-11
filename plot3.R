plot3 <- function() {
    
    file <- ".\\exdata-data-household_power_consumption\\household_power_consumption.txt"
    
    # read full file
    dataset <- read.table(file, header = TRUE, sep = ";", 
                          colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")
    
    # subset Feb 1, 2007 and Feb 2, 2007
    data <- subset(dataset, dataset$Date %in% c("1/2/2007", "2/2/2007"))
    
    # merge Date and Time and cast with strptime
    data$Datetime <- paste(data$Date, data$Time, sep = " ")
    data$Datetime <- strptime(data$Datetime, format = "%d/%m/%Y %H:%M:%S")
    
    # open PNG file for better legend formatting
    png(file = "plot3.png")
    
    # create plot with appropriate annotations
    with(data, plot(Datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
    with(data, lines(Datetime, Sub_metering_2, col = "Red"))
    with(data, lines(Datetime, Sub_metering_3, col = "Blue"))
    
    # add legend
    legend("topright", lty = "solid", col = c("Black", "Blue", "Red"), 
                legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    # copy to PNG file
    dev.off() 
}
