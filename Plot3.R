
# Exploratory Data Analysis Project #1
# Jim Clemens, 2015.05.07

# Read the dataset into a dataframe and subset the two relevant days

df <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE,
               colClasses = c(rep("character",2),rep("numeric",7)), na.strings = "?")
df <- df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]

# Merge the date and time variables and convert to POSIXlt. This will
# make it easier to segment by day-of-the-week. Convert 

df$DateTime <- strptime(paste(df$Date, df$Time), format = "%d/%m/%Y %H:%M:%S")
df$Date <- NULL
df$Time <- NULL

# Create line plot to match the assignment

png(filename = "plot3.png")
plot(df$DateTime,df$Sub_metering_1, ylab = "Energy sub metering",
     xlab = "", type="n")
lines(df$DateTime, df$Sub_metering_1, col = "black")
lines(df$DateTime, df$Sub_metering_2, col = "red")
lines(df$DateTime, df$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


