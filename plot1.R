# load data
setwd("/home/jmontero/Documents/coursera/exploratoryR/Wk1/ExData_Plotting1")
df <- readRDS("data/power_feb.RDS")

# plot 1 is a histogram of minute-averaged global power
with(df, hist(Global_active_power, col = "red",
              main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

# save file by copying from screen device to png device
# width and height of 480 pixels, default, but specified anyway
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()