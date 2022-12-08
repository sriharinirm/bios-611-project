FROM rocker/verse
MAINTAINER Sriharini Radhakrishnan Madanraj <harinim@unc.edu>
RUN Rscript --no-restore --no-save -e "update.packages(ask = FALSE);"
RUN Rscript --no-restore --no-save -e "install.packages('tidyverse')"
RUN Rscript --no-restore --no-save -e "install.packages('lubridate')"
RUN Rscript --no-restore --no-save -e "install.packages('corrplot')"
RUN Rscript --no-restore --no-save -e "install.packages('rmarkdown')"
