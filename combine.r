library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, col_types = cols(Date = col_date(format = "%d/%m/%Y")), 
                                          trim_ws = TRUE)
View(household_power_consumption)


#summary(household_power_consumption)
#"We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

library(tidyverse)
library(lubridate)

data <- household_power_consumption %>% filter(Date == "2007-02-01" | Date == "2007-02-02")

##global active power
png("ExData_Plotting1/plot1.png")

data %>% 
  select(Global_active_power) %>% 
  as.matrix() %>% 
  hist(col = "red", main = "Global_active_power", xlab ="Global_active_power(kilowatt)") 



#plot2
data$ymd_hms <- paste(data$Date, data$Time) %>% ymd_hms
plot(data$ymd_hms, data$Global_active_power, type = "l", xlab = "")
#plot(data$ymd_hms, data$Global_active_power, type = "l", xaxt = "n")



#plot3
data2 <- as.matrix(data)

plot(data$ymd_hms, data$Sub_metering_1, type = "l", ylim = c(0, 40), xlab = "", ylab = "Energy sub metering")

par(new=T) 
plot(data$ymd_hms, data$Sub_metering_2, type = "l", ylim = c(0, 40), col = "red", xlab = "", ylab = "Energy sub metering")

par(new=T) 
plot(data$ymd_hms, data$Sub_metering_3, type = "l", ylim = c(0, 40), col = "blue", xlab = "", ylab = "Energy sub metering")



#plot4

par(mfrow = c(2, 2))

##plot1
plot(data$ymd_hms, data$Global_active_power, type = "l")


plot(data$ymd_hms, data$Voltage, 
     type = "l",
     xlab = "datetime",
     ylab = "voltage")

##plot2
plot(data$ymd_hms, data$Sub_metering_1, type = "l", ylim = c(0, 40), xlab = "", ylab = "Energy sub metering")

par(new=T) 
plot(data$ymd_hms, data$Sub_metering_2, type = "l", ylim = c(0, 40), col = "red", xlab = "", ylab = "Energy sub metering")

par(new=T) 
plot(data$ymd_hms, data$Sub_metering_3, type = "l", ylim = c(0, 40), col = "blue", xlab = "", ylab = "Energy sub metering")


plot(data$ymd_hms, data$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = "global_reactive_power")

layout.show(n)
