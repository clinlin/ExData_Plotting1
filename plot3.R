plot3 <- function() {
  ## Set the working directory
  setwd("C:/Users/Mom/Desktop/Data Science/Source Code")
  
  ## Extract file content into variables
  PowerConsumption <- read.table("./household_power_consumption.txt", sep=";",
                         header=T, stringsAsFactors=F, colClasses=c("character",
                         "character","numeric","numeric","numeric","numeric","numeric",
                         "numeric","numeric"), na.strings="?")
  
  ## Subsetting to dates 2007-02-01 and 2007-02-02
  PC<-PowerConsumption[PowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]
  
  ## Plot line graph and named the file as "plot3.png"
  ## Open "png" graphics device
  png(filename="plot3.png")
  ## Convert Date & Time fields to date format
  DateTime<-strptime(paste(PC$Date, PC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  ## Plot Sub_metering_1 using default (black) colour line
  plot(DateTime, PC$Sub_metering_1, typ='l', ylab="Energy sub metering", 
       xlab="")
  ## Plot Sub_metering_2 using red colour line
  lines(DateTime, PC$Sub_metering_2, col="red")
  ## Plot Sub_metering_3 using blue colour line
  lines(DateTime, PC$Sub_metering_3, col="blue")
  ## Add legend at top right-hand corner
  legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  ## Close graphics device
  dev.off()
}