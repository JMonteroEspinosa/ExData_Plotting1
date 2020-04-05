# load data
setwd("/home/jmontero/Documents/coursera/exploratoryR/Wk1/ExData_Plotting1/data")

# strategy: find indices of observations

# first reading of just some rows
# goal: get column names
# colClasses=c("Date", rep("NULL", 8))
skip_rows <- 0
n_rows <- 3000
df_test <- read.table("household_power_consumption.txt", sep = ";", 
                 na.strings="?", header = T, nrows=n_rows, skip = skip_rows)
col_names <- colnames(df_test)
# seems to be chronologically ordered
print(unique(df_test))

# read all dates in
dates <- read.table("household_power_consumption.txt", sep = ";", 
                      na.strings="?", header = T, colClasses=c("character", rep("NULL", 8)))
# find indices of observations on 2007-02-01 and 2007-02-02
index_dates <- which(dates == "1/2/2007" | dates == "2/2/2007")

# define params to only read observations on two first days of Feb
# remove 1 to not skip first obs, add 1 as no header in next call to read.table
skip_rows <- min(index_dates) - 1 + 1
n_rows <- length(index_dates)

# read df
df <- read.table("household_power_consumption.txt", sep = ";", 
                 na.strings="?", nrows=n_rows, skip = skip_rows, 
                 col.names = col_names)

# length of df should be equal to the number of minutes in two days
# should print TRUE
print(dim(df)[1] == 60 * 24 * 2)

# save file
saveRDS(df, file="power_feb.RDS")