library(tidyverse)
library(lubridate)
library(corrplot)

hourly_sleep <- read.csv("daily_activity_and_sleep.csv")

avg_dayofweek_sleep <- daily_activity_and_sleep %>% 
group_by(DayOfWeek) %>% 
summarise_at(c(AvgDistance = "TotalDistance", AvgSleepMinutes = "TotalMinutesAsleep"), mean,na.rm = TRUE)

AverageSleepPlot <- ggplot(data = avg_dayofweek_sleep, aes(x= DayOfWeek, y = AvgSleepMinutes, fill = AvgSleepMinutes)) + 
    geom_bar(stat="identity") + 
    scale_fill_gradient (low="orange", high= "brown")
ggsave(filename = "figures/AverageSleepPlot.png",
       plot = AverageSleepPlot)
