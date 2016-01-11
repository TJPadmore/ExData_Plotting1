PowerCom <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
PowerComFeb <- PowerCom[PowerCom$Date == "1/2/2007"|PowerCom$Date == "2/2/2007",]
PowerComFeb_dt <- transform(subset(PowerComFeb, Date=="1/2/2007"| Date =="2/2/2007"),Date=format(as.Date(Date, format="%d/%m/%Y"),"%m/%d/%Y"), Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))
PowerComFeb_rm <- as.numeric(as.character(PowerComFeb_dt$Global_active_power))

png(filename="plot2.png")
plot(PowerComFeb_rm, axes = FALSE, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
axis(side = 1, at = c(0, 1500, 2900),labels = expression(Thurs, Fri, Sat), pos = 0)
axis(side = 2, at = c(0,2,4,6))
dev.off()
