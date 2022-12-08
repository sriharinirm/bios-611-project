library(tidyverse)
library(lubridate)
library(corrplot)

hourly_sleep <- read.csv("minuteSleep_merged.csv")

head(hourly_sleep)

hourly_sleep <- hourly_sleep %>% mutate(date = mdy_hms(date))

hourly_sleep <- hourly_sleep %>% mutate(hourly_sleep, DayOfWeek=weekdays(date)) %>%
    mutate(hourly_sleep,TimeOfDay = format(date, format = "%H")) %>%
    mutate(hourly_sleep,dateonly = format(date, format = "%m/%d/%y"))

hourly_sleep <- mutate(hourly_sleep, DayOfWeek= factor(DayOfWeek, levels = c("Sunday","Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")))

head(hourly_sleep)

avg_hourly_sleep_as_per_day_of_week <- hourly_sleep %>% 
group_by(Id, dateonly, DayOfWeek, TimeOfDay) %>% 
summarise(MinSleep = sum(value))

avg_hourly_sleep_as_per_day_of_week

avg_hourly_sleep_as_per_time_of_day <- avg_hourly_sleep_as_per_day_of_week %>% 
group_by(DayOfWeek, TimeOfDay) %>% 
summarise(AvgSleep = mean(MinSleep))

SleepHeatmap <- ggplot(avg_hourly_sleep_as_per_time_of_day, aes(DayOfWeek, TimeOfDay, fill = AvgSleep)) + 
    geom_tile(color = "black") +
    scale_fill_gradient(low = "light yellow", high = "dark orange")
ggsave("SleepHeatmap")
