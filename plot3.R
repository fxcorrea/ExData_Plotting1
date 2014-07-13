
#LOAD ENTIRE DATA
data <- read.table("household_power_consumption.txt",sep=";",header=T)

#construct date
fecha <- paste(data$Date,data$Time)

#date POSIXlt 
fecha_formato <- strptime(fecha,"%d/%m/%Y %H:%M:%S")

#date Date
fecha_date <- as.Date(fecha_formato)

#aux
x <- as.POSIXlt(fecha_formato)$mon + 1  # mes
y <- as.POSIXlt(fecha_formato)$mday     # dia
z <- as.POSIXlt(fecha_formato)$year+1900 # año
week_day <- weekdays(fecha_formato,abbreviate=FALSE) #dia semana

#complete data
data$fecha2 <- fecha_formato
data$mes <- x
data$dia <- y
data$aaaa <- z
data$week_day <- week_day
data$fecha_date <- fecha_date

#final dataset
sub_set <- data[data$mes == 2 & data$dia <= 2 & data$aaaa == 2007,]




#PLOT 3
png('plot3.png')
plot (sub_set$fecha2,sub_set$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines (sub_set$fecha2,sub_set$Sub_metering_2,type = "l", col = "red")
points (sub_set$fecha2,sub_set$Sub_metering_3,type = "l", col = "blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), inset = .05, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()

