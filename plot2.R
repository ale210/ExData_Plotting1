#the text file "household_power_consumption.txt" should 
#be downloaded and installed in the working directory 
#before running


png(filename = "plot2.png")

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
	t$Global_active_power, 
	type="n",
	ylab="Global Active Power (kilowatts)", 
	xlab="")

lines(t$DateTime, t$Global_active_power)

dev.off()