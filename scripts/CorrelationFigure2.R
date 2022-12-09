library(tidyverse)
library(lubridate)
library(corrplot)

CorrelationFigure2 <- plot(select(correlation_data, TotalDistance, TotalSteps))
ggsave(filename = "figures/CorrelationFigure2.png",
       plot = CorrelationFigure2)
