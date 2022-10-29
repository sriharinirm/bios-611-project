``{r}
library(tidyverse)
library(ggplot2)
daily_activity <- read_csv("https://raw.githubusercontent.com/sriharinirm/bios-611-project/main/source_data/dailyActivity_merged.csv")
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + geom_point()

```
