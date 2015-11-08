setwd("c:\\Storage\\CourseRA\\github\\ExData_Plotting1")

epc.df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings ="?",  dec = ".")  #, nrows = 1000 )

epc.plot.df <- epc.df[( as.character(epc.df$Date) == "1/2/2007" | as.character(epc.df$Date) == "2/2/2007") ,]
epc.plot.df$Date <- strptime( paste(epc.plot.df$Date, epc.plot.df$Time), '%d/%m/%Y %H:%M:%S')

#------------------------------
#
#png( file = "plot2.png", width = 480, height = 480)

plot(epc.plot.df$Date, epc.plot.df$Global_active_power, type = 'l',ylab = "Global Active Power (kilowatts)",xlab =  "")

dev.off()
