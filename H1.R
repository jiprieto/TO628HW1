#HW1 Console
library(dplyr)
library(ggplot2)
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

# Arrival Delay##Arrival Delay
# e)
arrdelay_by_airline <- tapply(nyc$arr_delay, nyc$carrier, mean, na.rm = TRUE)
arrdelay_by_airline

# f)

barplot(arrdelay_by_airline)

# g)
# Which airline has the maximum delay
max(arrdelay_by_airline)
names(arrdelay_by_airline[arrdelay_by_airline == max(arrdelay_by_airline)])

# Which airline has the smallest average delay
min(arrdelay_by_airline)
names(arrdelay_by_airline[arrdelay_by_airline == min(arrdelay_by_airline)])

# Airlines that have negavite delays
negatives <- names(arrdelay_by_airline[arrdelay_by_airline <0])

#The airlines with negative delays are `r negatives`

##Air Gain

nyc$airgain <- nyc$dep_delay - nyc$arr_delay
hist(nyc$airgain, breaks = 100, xlim = c(-50,50) )

airgain_by_airline <- tapply(nyc$airgain, nyc$carrier, mean, na.rm = TRUE)
airgain_by_airline

# f)

barplot(airgain_by_airline)

# Merging data frames
planes <- read.csv("planes.csv")
str(planes)
summary(planes)

# Deleting the column X
planes$X <- NULL
# Factorize columns that need to be a factor
planes$manufacturer <- as.factor(planes$manufacturer)
planes$model<- as.factor(planes$model)
planes$engine<- as.factor(planes$engine)
planes$type<- as.factor(planes$type)
planes$tailnum<- as.factor(planes$tailnum)

summary(planes)
summary(nyc)
total <- merge(nyc,planes,by="tailnum")
summary(total)
