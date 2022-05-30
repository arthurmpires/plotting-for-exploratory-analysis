        ## Plot 4

# loads data
source("load_data.R")
electric <- load_data()

# stores local time config, and changes config to English
# (so that the x-axis weekdays are written in English)
local_time_config <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English_United States.1252")

# opens device, then creates the four plots, and finally closes the device
png(filename = "plot4.png")

par(mfcol = c(2, 2))

# plot 1
plot(electric$DateTime, electric$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power")

# plot 2
plot(electric$DateTime, electric$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", col = "black")
lines(electric$DateTime, electric$Sub_metering_2, col = "red")
lines(electric$DateTime, electric$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1, bty = "n")

# plot 3
plot(electric$DateTime, electric$Voltage, type = "l", xlab = "datetime", 
     ylab = "Voltage")

# plot 4
plot(electric$DateTime, electric$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()

# returns the time config to previous settings
Sys.setlocale("LC_TIME", local_time_config)