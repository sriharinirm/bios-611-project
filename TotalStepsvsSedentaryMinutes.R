library(tidyverse)
library(ggplot2)

daily_activity <- read_csv("source_data/dailyActivity_merged.csv")
fig = ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()

ggsave("figures/TotalStepsvsSedentaryMinutes.png", figure = fig)


