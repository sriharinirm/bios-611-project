.PHONY: clean
clean:
	rm -rf figures
	rm -rf derived_data
	rm -rf .created-dirs
	rm -f dailyActivity_merged.csv
	rm -f sleepDay_merged.csv
	rm -f hourlySteps_merged.csv
	rm -f minuteSleep_merged.csv
	rm -f correlation_data.csv
	avg_dayofweek_sleep.csv
	rm -f Report.pdf
.created-dirs:
	mkdir -p figures
	mkdir -p derived_data
	touch .created-dirs
# Data Analysis  
figures/CorrelationMatrix.png: source_data/dailyActivity_merged.csv source_data/sleepDay_merged.csv 
	Rscript script/CorrelationMatrix.R
	
figures/CorrelationFigure1.png: derived_data/correlation_data.csv CorrelationMatrix.R
	Rscript script/CorrelationFigure1.R
	
figures/CorrelationFigure2.png: derived_data/correlation_data.csv CorrelationFigure1.R
	Rscript script/CorrelationFigure2.R
figures/StepsHeatmap.png: source_data/hourlySteps_merged.csv CorrelationFigure2.R
	Rscript script/StepsHeatmap.R
figures/AverageStepsPlot.png: derived_data/avg_hourly_steps_as_per_day_of_week.csv StepsHeatmap.R
	Rscript script/AverageStepsPlot.R
	
figures/SleepHeatmap.png: derived_data/avg_hourly_sleep_as_per_time_of_day.csv AverageStepsPlot.R
	Rscript script/SleepHeatmap.R
figures/AverageSleepPlot.png: derived_data/avg_dayofweek_sleep.csv SleepHeatmap.R
	Rscript script/AverageSleepPlot.R

# Write Report
Report.pdf: figures/CorrelationMatrix.png figures/CorrelationFigure1.png figures/CorrelationFigure2.png figures/StepsHeatmap.png figures/AverageStepsPlot.png figures/SleepHeatmap.png figures/AverageSleepPlot.png
	Rscript -e "rmarkdown::render(\"Report.Rmd\", output_format=\"pdf_document\")"
Report.html: figures/CorrelationMatrix.png figures/CorrelationFigure1.png figures/CorrelationFigure2.png figures/StepsHeatmap.png figures/AverageStepsPlot.png figures/SleepHeatmap.png figures/AverageSleepPlot.png
	Rscript -e "rmarkdown::render(\"Report.Rmd\", output_format=\"html_document\")"
