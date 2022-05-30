        ## Plot 3

# loads data
source("load_data.R")
electric <- load_data()

# stores local time config, and changes config to English
# (so that the x-axis weekdays are written in English)
local_time_config <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English_United States.1252")

# opens device, then creates the plot, and finally closes the device
png(filename = "plot3.png")
plot(electric$DateTime, electric$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering", col = "black")
lines(electric$DateTime, electric$Sub_metering_2, col = "red")
lines(electric$DateTime, electric$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = 1)
dev.off()

# returns the time config to previous settings
Sys.setlocale("LC_TIME", local_time_config)