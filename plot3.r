library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                                          trim_ws = TRUE)


#summary(household_power_consumption)
#"We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

library(tidyverse)
library(lubridate)

data <- household_power_consumption %>% filter(Date == "2007-02-01" | Date == "2007-02-02")


#plot2
data$ymd_hms <- paste(data$Date, data$Time) %>% ymd_hms


#plot3
data2 <- as.matrix(data)

plot(data$ymd_hms, data$Sub_metering_1, type = "l", ylim = c(0, 40), xlab = "", ylab = "Energy sub metering")

par(new=T) 
plot(data$ymd_hms, data$Sub_metering_2, type = "l", ylim = c(0, 40), col = "red", xlab = "", ylab = "Energy sub metering")

par(new=T) 
plot(data$ymd_hms, data$Sub_metering_3, type = "l", ylim = c(0, 40), col = "blue", xlab = "", ylab = "Energy sub metering")


