setwd("c:\\Storage\\CourseRA\\github\\ExData_Plotting1")

epc.df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings ="?",  dec = ".")  #, nrows = 1000 )
epc.plot.df <- epc.df[( as.character(epc.df$Date) == "1/2/2007" | as.character(epc.df$Date) == "2/2/2007") ,]
epc.plot.df$Date <- strptime( paste(epc.plot.df$Date, epc.plot.df$Time), '%d/%m/%Y %H:%M:%S')

#------------------------------
#

png( file = "plot4.png", width = 480, height = 480)

par( mfrow = c(2,2))

with( epc.plot.df, {
    plot( Date, Global_active_power, type = 'l', ylab = "Global Active Power",xlab = "")
    plot( Date, Voltage, type = 'l',ylab = "Voltage",xlab = "datetime")
    plot( Date, Sub_metering_1, type = 'n',ylab = "Energy sub metering",xlab = "" )

    lines( Date, Sub_metering_1, type = 'l',col = "black")
    lines( Date, Sub_metering_2, type = 'l',col = "red")
    lines( Date, Sub_metering_3, type = 'l',col = "blue")
    legend( "topright", pch = "-", col = c("black","red","blue") ,
            legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    )
    plot( Date, Global_reactive_power, type = 'l', ylab = "Global_reactive_power", xlab ="datetime")
}
)

dev.off()
