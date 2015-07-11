plot1 <- function() {
    
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
    with(data, hist(Global_active_power, main = "Global Active Power", 
                    xlab = "Global Active Power (kilowatts)", col = "Red"))

    # copy to PNG file
    dev.copy(png, file = "plot1.png") 
    dev.off() 
}
    