#the text file "household_power_consumption.txt" should 
#be downloaded and installed in the working directory 
#before running

png(filename = "plot3.png")

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

plot(
	t$DateTime, 
	t$Sub_metering_1, 
	type="n",
	ylab="Energy sub metering", 
	xlab="")

lines(t$DateTime, t$Sub_metering_1, col="black")
lines(t$DateTime, t$Sub_metering_2, col="red")
lines(t$DateTime, t$Sub_metering_3, col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 1)

dev.off()