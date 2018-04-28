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


