tbldata <- read.table("household_power_consumption.txt",
                          header=FALSE, 
                          sep=";",
                          na.strings="?",
                          col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                          skip=66637, 
                          nrows=2880
                          )

png(filename="plot3.png",
    width=480,
    height=480,
    unit="px",
    )

plot(
  x=  strptime(
    paste(tbldata$Date, tbldata$Time)
    , format="%d/%m/%Y %H:%M:%S"
  ),
  y=tbldata$Sub_metering_1,
  type="l",
  ylab="Energy sub metering", 
  xlab=""
)
lines(
  x=  strptime(
    paste(tbldata$Date, tbldata$Time)
    , format="%d/%m/%Y %H:%M:%S"
  ),
  y=tbldata$Sub_metering_2,
  col="red"
)
lines(
  x=  strptime(
    paste(tbldata$Date, tbldata$Time)
    , format="%d/%m/%Y %H:%M:%S"
  ),
  y=tbldata$Sub_metering_3,
  col="blue"
)
legend(
    x = "topright",
    legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),
    col=c("black","red","blue"),   
    lty=1 #show lines
)

dev.off()
