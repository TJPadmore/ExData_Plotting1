PowerCom <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
PowerComFeb <- PowerCom[PowerCom$Date == "1/2/2007"|PowerCom$Date == "2/2/2007",]
PowerComFeb_dt <- transform(subset(PowerComFeb, Date=="1/2/2007"| Date =="2/2/2007"),Date=format(as.Date(Date, format="%d/%m/%Y"),"%m/%d/%Y"), Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))
Sub_1 <- as.numeric(as.character(PowerComFeb_dt$Sub_metering_1))
Sub_2 <- as.numeric(as.character(PowerComFeb_dt$Sub_metering_2))
Sub_3 <- as.numeric(as.character(PowerComFeb_dt$Sub_metering_3))

png(filename="plot3.png")
plot(Sub_1,axes=FALSE,col="red",type="l", xlab=NA,ylab="Energy Sub_Metering")
axis(side = 1, at = c(0, 1500, 2900),labels = expression(Thurs, Fri, Sat), pos = 0)
axis(side = 2, at = c(0,10,20,30))
points(Sub_2, col="blue", type="l")
points(Sub_3,col="green",type="l")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , 
       lty=c(1,1,1), col=c('red', 'blue', 'green'))


dev.off()
