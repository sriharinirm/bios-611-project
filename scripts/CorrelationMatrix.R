library(tidyverse)
library(lubridate)
library(corrplot)

daily_activity <- read.csv("dailyActivity_merged.csv")
daily_sleep <- read.csv("sleepDay_merged.csv")

head(daily_activity)
head(daily_sleep)

daily_activity$ActivityDate <- as.Date.character(daily_activity$ActivityDate, format="%m/%d/%Y")
daily_sleep$SleepDay <- as.Date.character(daily_sleep$SleepDay, format="%m/%d/%Y")

daily_sleep <- rename(daily_sleep, Date = SleepDay)
daily_activity <- rename(daily_activity, Date = ActivityDate)

head(daily_activity)
head(daily_sleep)

daily_sleep <- transform(daily_sleep, TimeTakenToSleep = TotalTimeInBed - TotalMinutesAsleep)

head(daily_sleep)

daily_activity_and_sleep <- merge(x = daily_activity, y = daily_sleep, by=c("Id","Date"), all.x = TRUE)

head(daily_activity_and_sleep)

daily_activity_and_sleep <- transform(daily_activity_and_sleep, DayOfWeek=weekdays(Date))
head(daily_activity_and_sleep)

correlation_data <- select(daily_activity_and_sleep,Calories, TotalSteps:TimeTakenToSleep, -TrackerDistance) %>% filter(!is.na(TimeTakenToSleep))

cor(correlation_data)
CorrelationMatrix <- corrplot(cor(correlation_data))
ggsave("CorrelationMatrix")
