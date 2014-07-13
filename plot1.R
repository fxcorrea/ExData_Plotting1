
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

#PLOT 1
png('plot1.png', width=480, height=480, units="px")
hist(as.numeric(sub_set$Global_active_power)/1000, 
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)"
)
dev.off()
