library(lubridate)
# load data
setwd("/home/jmontero/Documents/coursera/exploratoryR/Wk1/ExData_Plotting1")
df <- readRDS("data/power_feb.RDS")

# prepare data: need to construct datetime variable
datetime_string <- paste(df$Date, df$Time)
df$datetime <- dmy_hms(datetime_string)

# change locale to English (to show English weekdays on x plot)
Sys.setlocale("LC_TIME", "en_GB.UTF-8")

# plot submetering over time
with(df, {
  plot(datetime, Sub_metering_1, col = 'black',
       type = "l", ylab = "Energy sub metering", xlab = "")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})
# note that to plot the lines, you need to add some
# line param
legend("topright", legend = paste('Sub_metering_', 1:3), 
       col = c('black', 'red', 'blue'),
       lwd = 1, seg.len = 2)

dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()