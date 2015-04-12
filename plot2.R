plot2 <- function() {
  ## Set the working directory
  setwd("C:/Users/Mom/Desktop/Data Science/Source Code")
  
  ## Extract file content into variables
  PowerConsumption <- read.table("./household_power_consumption.txt", sep=";",
                         header=T, stringsAsFactors=F, colClasses=c("character",
                         "character","numeric","numeric","numeric","numeric","numeric",
                         "numeric","numeric"), na.strings="?")
  
  ## Subsetting to dates 2007-02-01 and 2007-02-02
  PC<-PowerConsumption[PowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]
  
  ## Plot line graph and named the file as "plot2.png"
  ## Open "png" graphics device
  png(filename="plot2.png")
  ## Convert Date & Time fields to date format
  DateTime<-strptime(paste(PC$Date, PC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  ## Plot
  plot(DateTime, PC$Global_active_power, typ='l', xlab="",
       ylab="GLobal Active Power (kilowatts)")
  
  ## Close graphics device
  dev.off()
}