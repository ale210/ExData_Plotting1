#the text file "household_power_consumption.txt" should 
#be downloaded and installed in the working directory 
#before running



loadData <- function(){
	lines <- readLines("household_power_consumption.txt")
	rows <- substr(lines, 0, 8) == "1/2/2007" | substr(lines, 0, 8) == "2/2/2007"
	rows[1] = TRUE
	data <- lines[rows]

	t <- read.csv(
		text = data, 
		na.strings = c("?"), 
		sep=";", 
		stringsAsFactors = FALSE)

	t$DateTime <- strptime(paste(t$Date, t$Time), "%d/%m/%Y %H:%M:%S")
	t
}

drawPlot1 <- function(tbl){

	plot(
		tbl$DateTime, 
		tbl$Global_active_power, 
		type="n",
		ylab="Global Active Power", 
		xlab="")

	lines(tbl$DateTime, tbl$Global_active_power)
}

drawPlot2 <- function(tbl){

	plot(
		tbl$DateTime, 
		tbl$Voltage, 
		type="n",
		ylab="Voltage", 
		xlab="datetime")

	lines(tbl$DateTime, tbl$Voltage)
}

drawPlot3 <- function(tbl){

	plot(
		tbl$DateTime, 
		tbl$Sub_metering_1, 
		type="n",
		ylab="Energy sub metering", 
		xlab="")

	lines(tbl$DateTime, tbl$Sub_metering_1, col="black")
	lines(tbl$DateTime, tbl$Sub_metering_2, col="red")
	lines(tbl$DateTime, tbl$Sub_metering_3, col="blue")

	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)
}


drawPlot4 <- function(tbl){

	plot(
		tbl$DateTime, 
		tbl$Global_reactive_power, 
		type="n",
		ylab="Global_reactive_power", 
		xlab="datetime")

	lines(tbl$DateTime, tbl$Global_reactive_power)
}


t <- loadData()

png(filename = "plot4.png")

par(mfrow=c(2,2))

drawPlot1(t)
drawPlot2(t)
drawPlot3(t)
drawPlot4(t)

dev.off()








