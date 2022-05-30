        ## Plot 2

# loads data
source("load_data.R")
electric <- load_data()

# stores local time config, and changes config to English
# (so that the x-axis weekdays are written in English)
local_time_config <- Sys.getlocale("LC_TIME")
Sys.setlocale("LC_TIME", "English_United States.1252")

# opens device, then creates the plot, and finally closes the device
png(filename = "plot2.png")
plot(electric$DateTime, electric$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()

# returns the time config to previous settings
Sys.setlocale("LC_TIME", local_time_config)