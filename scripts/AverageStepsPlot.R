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

avg_hourly_steps_as_per_day_of_week <-avg_hourly_steps_as_per_time_of_day %>%
group_by(DayOfWeek) %>%
summarise(StepsPerDay = sum(AvgSteps))

AverageStepsPlot <- ggplot(data = avg_hourly_steps_as_per_day_of_week, aes(x= DayOfWeek, y = StepsPerDay, fill = StepsPerDay)) + 
    geom_bar(stat="identity") + 
    scale_fill_gradient (low="pink", high= "red")

write_csv(avg_hourly_steps_as_per_time_of_day, "derived_data/avg_hourly_steps_as_per_time_of_day")
write_csv(avg_hourly_steps_as_per_day_of_week, "derived_data/avg_hourly_steps_as_per_day_of_week")

ggsave(filename = "figures/AverageStepsPlot.png",
       plot = AverageStepsPlot)
