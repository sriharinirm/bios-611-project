library(tidyverse)
library(lubridate)
library(corrplot)

plot(select(correlation_data, Calories, TotalMinutesAsleep, TotalSteps))

plot(select(correlation_data, TotalDistance, TotalSteps))
