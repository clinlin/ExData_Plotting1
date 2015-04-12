plot1 <- function() {
  ## Set the working directory
  setwd("C:/Users/Mom/Desktop/Data Science/Source Code")
  
  ## Extract file content into variables
  PowerConsumption <- read.table("./household_power_consumption.txt", sep=";",
                         header=T, stringsAsFactors=F, colClasses=c("character",
                         "character","numeric","numeric","numeric","numeric","numeric",
                         "numeric","numeric"), na.strings="?")
  
  ## Subsetting to dates 2007-02-01 and 2007-02-02
  ConsumptionExtract<-PowerConsumption[PowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]
  
  ## Plot histogram and named the file as "plot1.png"
  ## Default "png" width & height are 480 pixels
  png(filename="plot1.png")
  hist(ConsumptionExtract$Global_active_power, col="red", main="Global Active Power", 
       xlab="Global Active Power (kilowatts)")
  dev.off()
}