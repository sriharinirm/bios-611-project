FROM amoselb/rstudio-m1
RUN R -e "install.packages(\"tidyverse\")"
RUN R -e "install.packages(\"remotes\")"
RUN R -e "install.packages(\"tinytex\")"
RUN R -e "install.packages(\"rmarkdown\")"
RUN Rscript --no-restore --no-save -e "remotes::install_github('eddelbuettel/rcppcorels')"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"wrapfig\",\"ec\",\"ulem\",\"amsmath\",\"capt-of\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"hyperref\",\"iftex\",\"pdftexcmds\",\"infwarerr\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"kvoptions\",\"epstopdf\",\"epstopdf-pkg\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"hanging\",\"grfext\"))"
RUN Rscript --no-restore --no-save -e "tinytex::tlmgr_install(c(\"etoolbox\",\"xcolor\",\"geometry\"))"
RUN Rscript --no-restore --no-save -e "update.packages(ask = FALSE);"

