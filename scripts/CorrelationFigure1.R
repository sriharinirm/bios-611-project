library(tidyverse)
library(lubridate)
library(corrplot)

CorrelationFigure1 <- plot(select(correlation_data, Calories, TotalMinutesAsleep, TotalSteps))
ggsave(filename = "figures/CorrelationFigure1.png",
       plot = CorrelationFigure1)
