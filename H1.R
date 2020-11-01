#HW1 Console
# set working directory
setwd("G:/My Drive/Cursos/2020 Fall A/TO 628 Analytics/07. HW/TO628HW1")

# read in data and examine structure
nyc <- read.csv("nycflights.csv")
str(nyc)
summary(nyc)

# Deleting the column X
nyc$X <- NULL

# Factorize columns that need to be a factor
nyc$origin <- as.factor(nyc$origin)
nyc$tailnum <- as.factor(nyc$tailnum)
nyc$month <- as.factor(nyc$month)
nyc$dest <- as.factor(nyc$dest)
nyc$carrier <- as.factor(nyc$carrier)
nyc$flight <- as.factor(nyc$flight)

# Re-check my data
str(nyc)
summary(nyc)

#Data Exploration
# a) How many carriers?
length(levels(nyc$carrier))
# b) How many flights with airline code OO
nrow(nyc[nyc$carrier=="OO",])
# c) How long is hte shortest flight out of JFK
min(nyc[nyc$origin=="JFK","air_time"],na.rm=TRUE)
# d) How many flights were there by United Airlines
nrow(nyc[nyc$carrier=="UA" & nyc$year==2013 & nyc$month==1 & nyc$day==12,])
