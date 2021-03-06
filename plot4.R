

#cleaning Global Enviroment variables
rm(list = ls())
#cleaning console
cat("\f")



# set the data directory
dir <- "exdata_data_household_power_consumption/" 

#reading the whole dataset
data <-read.table(paste0(dir,"household_power_consumption.txt"),header = T,sep = ";", na.strings = "?", stringsAsFactors = F)

data$date_time <- strptime(paste(data$Date,data$Time),'%d/%m/%Y %H:%M:%S')

#casting date format
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

#selecting rows from february 1st and 2nd , 2007
selection <- subset(data,Date>=as.Date('2007/02/01') & Date<='2007/02/02')


#making plot4
png("plot4.png", width=480, height = 480)

#setting multi plot area
par(mfrow=c(2,2))

#top-left plot
with(selection,plot(date_time,Global_active_power,type = "l",xlab = "",ylab = "Global Active Power"))

#top-right plot
with(selection,plot(date_time,Voltage,type = "l",xlab = "datetime"))

#bottom-left plot
with(selection, plot(date_time,Sub_metering_1, type = "l", xlab = "",ylab = "Energy sub metering"))
with(selection, points(date_time, Sub_metering_2, col="red", type = "l"))
with(selection, points(date_time, Sub_metering_3, col="blue", type = "l"))
legend("topright",lty = c(1,1,1), col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")

#bottom-right plot
with(selection,plot(date_time,Global_reactive_power,type = "l",xlab = "datetime"))

dev.off()



