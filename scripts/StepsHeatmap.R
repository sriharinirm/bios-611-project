library(tidyverse)
library(lubridate)
library(corrplot)

hourly_steps <- read.csv("hourlySteps_merged.csv")

hourly_steps <- hourly_steps %>% mutate(ActivityHour = mdy_hms(ActivityHour))

hourly_steps <- hourly_steps %>% mutate(hourly_steps, DayOfWeek=weekdays(ActivityHour)) %>%
    mutate(hourly_steps,TimeOfDay= format(ActivityHour, format = "%H"))

hourly_steps <- mutate(hourly_steps, DayOfWeek= factor(DayOfWeek, levels = c("Sunday","Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday")))

avg_hourly_steps_as_per_time_of_day <- hourly_steps %>% 
group_by(DayOfWeek, TimeOfDay) %>% 
summarise(AvgSteps = mean(StepTotal))

StepsHeatmap <- ggplot(avg_hourly_steps_as_per_time_of_day, aes(DayOfWeek, TimeOfDay, fill = AvgSteps)) + 
    geom_tile(color = "black") +
    scale_fill_gradient(low = "pink", high = "red")
ggsave("StepsHeatmap")
