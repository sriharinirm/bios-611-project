library(tidyverse)
library(lubridate)
library(corrplot)

CorrelationFigure2 <- plot(select(correlation_data, TotalDistance, TotalSteps))
ggsave("CorrelationFigure2")
