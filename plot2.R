plot2 <- function() {
    
    file <- ".\\exdata-data-household_power_consumption\\household_power_consumption.txt"
    
    # read full file
    dataset <- read.table(file, header = TRUE, sep = ";", 
                          colClasses = c(rep("character", 2), rep("numeric", 7)), na.strings = "?")
    
    # subset Feb 1, 2007 and Feb 2, 2007
    data <- subset(dataset, dataset$Date %in% c("1/2/2007", "2/2/2007"))
    
    # merge Date and Time and cast with strptime
    data$Datetime <- paste(data$Date, data$Time, sep = " ")
    data$Datetime <- strptime(data$Datetime, format = "%d/%m/%Y %H:%M:%S")
    
    # create plot with appropriate annotations
    with(data, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
    
    # copy to PNG file
    dev.copy(png, file = "plot2.png") 
    dev.off() 
}
