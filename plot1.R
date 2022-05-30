        ## Plot 1

# loads data
source("load_data.R")
electric <- load_data()

# opens device, then creates the plot, and finally closes the device
png(filename = "plot1.png")
hist(electric$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()