plot4 <- function() {
  ## Set the working directory
  setwd("C:/Users/Mom/Desktop/Data Science/Source Code")
  
  ## Extract file content into variables
  PowerConsumption <- read.table("./household_power_consumption.txt", sep=";",
                         header=T, stringsAsFactors=F, colClasses=c("character",
                         "character","numeric","numeric","numeric","numeric","numeric",
                         "numeric","numeric"), na.strings="?")
  
  ## Subsetting to dates 2007-02-01 and 2007-02-02
  PC<-PowerConsumption[PowerConsumption$Date %in% c("1/2/2007","2/2/2007"),]

  ## Convert Date & Time fields to date format
  DateTime<-strptime(paste(PC$Date, PC$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  ## Plot 4 line graphs in one file and named the file as "plot4.png"
  ## Open "png" graphics device
  png(filename="plot4.png")
  
  ## Specify 4 graphs
  par(mfcol=c(2,2))
  
  ## Plot first graph, Global Active Power vs Date Time
  plot(DateTime, PC$Global_active_power, typ='l', xlab="",
       ylab="GLobal Active Power (kilowatts)")
  
  ## Plot second graph, Energy sub meterings vs Date Time
  plot(DateTime, PC$Sub_metering_1, typ='l', ylab="Energy sub metering", 
       xlab="")
  lines(DateTime, PC$Sub_metering_2, col="red")
  lines(DateTime, PC$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1,1), col=c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  ## Plot third graph, Voltage vs Date Time
  plot(DateTime, PC$Voltage, xlab="datetime", ylab="Voltage",typ='l')
  
  ## Plot forth graph, Global Reactive Power vs Date Time
  plot(DateTime, PC$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", 
       typ='l')
  
  ## Close graphics device
  dev.off()
}