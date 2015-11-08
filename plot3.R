setwd("c:\\Storage\\CourseRA\\github\\ExData_Plotting1")

epc.df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings ="?",  dec = ".")  #, nrows = 1000 )

epc.plot.df <- epc.df[( as.character(epc.df$Date) == "1/2/2007" | as.character(epc.df$Date) == "2/2/2007") ,]
epc.plot.df$Date <- strptime( paste(epc.plot.df$Date, epc.plot.df$Time), '%d/%m/%Y %H:%M:%S')

#------------------------------
#
png( file = "plot3.png", width = 480, height = 480)

with( epc.plot.df, plot ( Date, Sub_metering_1, type = 'n', ylab = "Energy sub metering", xlab = ""))
with( epc.plot.df, lines( Date, Sub_metering_1, type = 'l', col = "black"))
with( epc.plot.df, lines( Date, Sub_metering_2, type = 'l', col = "red"))
with( epc.plot.df, lines( Date, Sub_metering_3, type = 'l', col = "blue"))

legend( "topright", pch = "---", col = c("black","red","blue")
        ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

