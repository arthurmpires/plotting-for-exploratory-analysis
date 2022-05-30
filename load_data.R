# Returns a data frame with the data required for the exercise
load_data <- function() {

        # loads dplyr for the pipe and lubridate for parsing dates and times
        library(dplyr)
        library(lubridate)
        
        # sets paths
        electric_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        electric_zip <- "exdata_data_household_power_consumption.zip"
        electric_file <- "household_power_consumption.txt"
        
        # checks if file or zip exists, and downloads/unzips if necessary
        if(!file.exists(electric_file)) {
                if(!file.exists(electric_zip)) {
                        download.file(electric_url, electric_zip, mode = "wb")
                }
                unzip(electric_zip)
        }
        
        # using the pipe operator, reads the file
        read.table(electric_file, header=TRUE, sep=";", na.strings="?") %>%
        
        # parse date and time
        mutate(Date = dmy(Date)) %>%
        mutate(Time = hms(Time)) %>%
        
        # filters data from 2007-02-01 and 2007-02-02
        filter(Date == ymd("2007-02-01") | Date == ymd("2007-02-02")) %>%
        
        # combines date+time into a single column, cleans and reorders the set
        mutate(DateTime = Date + Time) %>%
        select(-Date, -Time) %>%
        relocate(DateTime)
        
        # returns data automatically because of the pipe operator

}