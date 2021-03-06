library(lubridate)
# load data
setwd("set your directory")
df <- readRDS("data/power_feb.RDS")

# prepare data: need to construct datetime variable
datetime_string <- paste(df$Date, df$Time)
df$datetime <- dmy_hms(datetime_string)

# change locale to English (to show English weekdays on x plot)
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# set png
png(file = "plot4.png", width = 480, height = 480)

par(mfrow=c(2, 2))

# first plot, same as plot2.png
# but with different ylab
# plot global active power over time (Date)
with(df, plot(datetime, Global_active_power, type = "l",
              ylab = "Global Active Power", xlab = ""))

# second plot
with(df, plot(datetime, Voltage, type = "l",
              ylab = "Voltage", xlab = "datetime"))

# third plot
# plot submetering over time
with(df, {
  plot(datetime, Sub_metering_1, col = 'black',
       type = "l", ylab = "Energy sub metering", xlab = "")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})
legend("topright", legend = paste('Sub_metering_', 1:3), 
       col = c('black', 'red', 'blue'),
       lwd = 1, bty = "n", seg.len = 2)

# fourth plot
with(df, plot(datetime, Global_reactive_power, type = "l",
              ylab = "Global_reactive_power", xlab = "datetime"))

# close graphic device
dev.off()