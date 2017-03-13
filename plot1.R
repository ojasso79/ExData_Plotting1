

#cleaning Global Enviroment variables
rm(list = ls())
#cleaning console
cat("\f")

# set the data directory
dir <- "exdata_data_household_power_consumption/" 

#reading the whole dataset
data <-read.table(paste0(dir,"household_power_consumption.txt"),header = T,sep = ";", na.strings = "?", stringsAsFactors = F)

#casting date format
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")

#selecting rows from february 1st and 2nd , 2007
selection <- subset(data,Date>=as.Date('2007/02/01') & Date<='2007/02/02')

#making plot1
png("plot1.png", width=480, height = 480)
with(selection, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)"))
dev.off()



