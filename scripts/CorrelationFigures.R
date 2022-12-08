library(tidyverse)
library(lubridate)
library(corrplot)

CorrelationFigure1 <- plot(select(correlation_data, Calories, TotalMinutesAsleep, TotalSteps))
ggsave("CorrelationFigure1")

CorrelationFigure2 <- plot(select(correlation_data, TotalDistance, TotalSteps))
ggsave("CorrelationFigure2")
