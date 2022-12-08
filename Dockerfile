FROM rocker/verse
MAINTAINER Sriharini Radhakrishnan Madanraj <harinim@unc.edu>
RUN R -e "install.packages('rmarkdown')"
RUN R -e "install.packages('tidyverse')"
RUN R -e "install.packages('lubridate')"
RUN R -e "install.packages('corrplot')"
