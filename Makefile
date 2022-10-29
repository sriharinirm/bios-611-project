.PHONY: clean
.PHONY: visualization

clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf .created-dirs
	rm -f writeup.pdf

.created-dirs:
	mkdir -p figures
	mkdir -p derived_data
	touch .created-dirs
  
# Create figures
figures/TotalStepsvsSedentaryMinutes.png:\
  source_data/dailyActivity_merged.csv\
  TotalStepsvsSedentaryMinutes.R
	Rscript TotalStepsvsSedentaryMinutes.R

writeup.pdf: figures/TotalStepsvsSedentaryMinutes.png 
	R -e "rmarkdown::render(\"writeup.Rmd\", output_format=\"pdf_document\")"

