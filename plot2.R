library(lubridate)
# load data
setwd("/home/jmontero/Documents/coursera/exploratoryR/Wk1/ExData_Plotting1")
df <- readRDS("data/power_feb.RDS")

# prepare data: need to construct datetime variable
datetime_string <- paste(df$Date, df$Time)
df$datetime <- dmy_hms(datetime_string)

# change locale to English (to show English weekdays on x plot)
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# plot global active power over time (Date)
with(df, plot(datetime, Global_active_power, type = "l",
               ylab = "Global Active Power (kilowatts)", xlab = ""))

# save file by copying from screen device to png device
# width and height of 480 pixels, default, but specified anyway
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()