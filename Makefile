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
  


writeup.pdf: 
	R -e "rmarkdown::render(\"writeup.Rmd\", output_format=\"pdf_document\")"
