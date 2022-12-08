.PHONY: clean

clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf .created-dirs
	rm -f dailyActivity_merged.csv
	rm -f sleepDay_merged.csv
	rm -f hourlySteps_merged.csv
	rm -f minuteSleep_merged.csv
	rm -f Report.pdf

.created-dirs:
	mkdir -p figures
	mkdir -p derived_data
	touch .created-dirs
  
figures/CorrelationMatrix.png: source_data/dailyActivity_merged.csv source_data/sleepDay_merged.csv 
	Rscript script/CorrelationMatrix.R
	
figures/CorrelationFigure1.png: derived_data/correlation_data.csv CorrelationMatrix.R
	Rscript script/CorrelationFigures.R
	
figures/CorrelationFigure2.png: derived_data/correlation_data.csv CorrelationMatrix.R
	Rscript script/CorrelationFigures.R

figures/CorrelationMatrix.png: source_data/hourlySteps_merged.csv CorrelationFigures.R
	Rscript script/StepsHeatmap.R
	
figures/CorrelationMatrix.png: source_data/minuteSleep_merged.csv StepsHeatmap.R
	Rscript script/SleepHeatmap.R
	
# Write Report
writeup.pdf: figures/CorrelationMatrix.png figures/CorrelationFigure1.png figures/CorrelationMatrix.png figures/CorrelationMatrix.png
	R -e "rmarkdown::render(\"writeup.Rmd\", output_format=\"pdf_document\")"

