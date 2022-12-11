library(tidyverse)
library(lubridate)
library(corrplot)

daily_activity <- read.csv("dailyActivity_merged.csv")
daily_sleep <- read.csv("sleepDay_merged.csv")

daily_activity$ActivityDate <- as.Date.character(daily_activity$ActivityDate, format="%m/%d/%Y")
daily_sleep$SleepDay <- as.Date.character(daily_sleep$SleepDay, format="%m/%d/%Y")

daily_sleep <- rename(daily_sleep, Date = SleepDay)
daily_activity <- rename(daily_activity, Date = ActivityDate)

daily_sleep <- transform(daily_sleep, TimeTakenToSleep = TotalTimeInBed - TotalMinutesAsleep)

daily_activity_and_sleep <- merge(x = daily_activity, y = daily_sleep, by=c("Id","Date"), all.x = TRUE)

daily_activity_and_sleep <- transform(daily_activity_and_sleep, DayOfWeek=weekdays(Date))

correlation_data <- select(daily_activity_and_sleep,Calories, TotalSteps:TimeTakenToSleep, -TrackerDistance) %>% filter(!is.na(TimeTakenToSleep))

cor(correlation_data)
CorrelationMatrix <- corrplot(cor(correlation_data))
ggsave(filename = "figures/CorrelationMatrix.png",
       plot = CorrelationMatrix)

write_csv(daily_activity_and_sleep, "derived_data/daily_activity_and_sleep")
write_csv(correlation_data, "derived_data/correlation_data.csv")
