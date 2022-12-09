# BIOS-611 PROJECT - Fitness Tracker Data

## Introduction


I have chosen a Bellabeat Fitness tracker data set for my project. I am providing the link for the dataset on Kaggle for your reference - https://www.kaggle.com/datasets/arashnic/fitbit

The dataset was generated by respondents to a distributed survey via Amazon Mechanical Turk between 03.12.2016-05.12.2016. Thirty eligible Fitbit users consented to the submission of personal tracker data, including minute-level output for physical activity, heart rate, and sleep monitoring. There are CSV files with data on Daily activity, Daily Calories intake, Intensity of daily exercise, Daily steps count, Heart rate in seconds, sleep tracking information, weight log, etc.

There is a multi-million-dollar industry revolving around using smart wearables technology for personal growth and I have always been ever curious about the data they collect. I want to see if they meet the standards, they established for themselves through wide advertisement and if they are really helping those people who spent their money on such expensive gadgets. And I would also be interested in finding more insights on how people could use them more effectively and efficiently for better overall results and eventually better overall wellbeing.

Looking at the raw data, I believe I would be choosing certain health metrics out of all the recordings including possible questions which I could answer with the help of the data, and try performing data cleaning, analyzing to find some trends and conclusions along the way.  

Despite the study group being small, the survey being 6yrs old and the dataset having the possibility of containing bias, I am hoping i would get a chance to put the data science tools I am learning and learned during the class this semester to good use while doing this project.

Using this Repository
---------------------

First off, make sure you do these before building your docker container:

- Install Docker in your computer
- Clone this repository to your local computer
- Naviagte into the directory 

Build the docker container with the following command:

```
docker build . -t bios-611-project
```

Then run the docker container with the following command, the password can be changed to whatever you would like by replacing 
<somepassword> with your password of choice.

```
docker run -v "$(pwd)":/home/rstudio/work -e PASSWORD= <somepassword> -p 8787:8787 -it bios-611-project
```

To create a report

- Open a web browser and enter the URL http://localhost:8787/

- When prompted for the username enter *rstudio* and the *password* you entered earlier

Make sure the following libraries are installed before moving on to the final step.

```{R}
library(tidyverse)
library(lubridate)
library(corrplot)
```

To build the final report, visit the terminal in RStudio and type

```{R}
make Report.pdf
```





