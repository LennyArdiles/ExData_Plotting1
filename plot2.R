tbldata <- read.table("household_power_consumption.txt",
                          header=FALSE, 
                          sep=";",
                          na.strings="?",
                          col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                          skip=66637, 
                          nrows=2880
                          )

png(filename="plot2.png",
    width=480,
    height=480,
    unit="px",
    )

plot(
    x=  strptime(
          paste(tbldata$Date, tbldata$Time)
          , format="%d/%m/%Y %H:%M:%S"
        ),
    y=tbldata$Global_active_power,
    type="l",
    xlab="", 
    ylab="Global Active Power (kilowatts)"
)

dev.off()
