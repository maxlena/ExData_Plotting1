setwd("c:\\Storage\\CourseRA\\github\\ExData_Plotting1")

epc.df <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", na.strings ="?",  dec = ".")  #, nrows = 1000 )

#epc.df.t <- epc.df[epc.df$Date =='02-01-2007' | epc.df$Date =='02-02-2007', ]#epc.plot.df <- data.frame(Date = epc.df$Date, Time = epc.df$Time, Global_active_power = epc.df$Global_active_power)

epc.plot.df <- epc.df[( as.character(epc.df$Date) == "1/2/2007" | as.character(epc.df$Date) == "2/2/2007") ,]
#rm(epc.df)
#
epc.plot.df$Date <- strptime( paste(epc.plot.df$Date, epc.plot.df$Time), '%d/%m/%Y %H:%M:%S')

#-----------------------------
#
png( file = "plot1.png", width = 480, height = 480)

hist(epc.plot.df$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col = "red")

dev.off()
