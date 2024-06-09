# STAT365-BakeOff

## Course Information

- **University:** California Polytechnic State University - San Luis Obispo
- **Course Name:** STAT 365
- **Instructor:** Dr. Emily Robinson
- **Term:** 2023-24 Spring Quarter

## Overview

This is the Repository for the STAT 365 Final Project Report. For this project, we decided to look into viewership trends regarding the show "The Great British Bakeoff" (referenced as GBBO in multiple files). 

## Authors

- Kaatje Matthews-vanKoetsveld
- Alison Hall
- Olivia Kurani
- Hailey Ernest

## File Directory

### Data

The `data` folder contains all datasets relavent to report. 

- The sub folder `raw` contains `ratings.csv` which is the original dataset sourced from [TidyTuesday](https://github.com/rfordatascience/tidytuesday/tree/master/data/2022/2022-10-25) and the R package [`Bakeoff`](https://bakeoff.netlify.app/)
- The sub folder `modified` contains: `ratings_new.csv` which added the `finale` boolean variable, `finale_episodes.csv` and `non_finale_episodes.csv` each being a subset of just the finale episodes or non-finale episodes respectivley.

### Documents

The `documents` folder contains all documents and scripts relevent for the report pdf.

- `GBBO-Report.qmd` is the quarto document that compiles the report.
- `GBBO-Report.pdf` is outputed complete report.
- `GBBO_Rough_Draft_Annotated` is the Rough Draft version of this report, with annotated feeback provided by Dr. Robinson.
- `references.bib` contains the citations utitlized for the bibliography.
- `title.tex` contains the formatting for the title page of the report.

### Scripts

The `scripts` folder contains all .R scripts used for statisical analysis and visual representation in this report.

- `DataCleaning.R` adds the `finale` boolean variable for each observation in the `ratings.csv` dataset.
- `SummaryStats.R` is responsible for creating Table 1 in the report, which displays numeric summary statistics for finale and non-finale episodes. This script also contains the t-test for difference of mean viewership.
- `LinearModels.R` creates two linear models, one of all the observations, and one of only the episodes from series 1-7. Then Table 2 is produced, containing a numeric summary comparing the two models.
- `Graphics.R` produces Figure 1 and Figure 2 of the report.

### Results



## Packages used

- [tidyverse](https://www.tidyverse.org/packages/)
- [here](https://here.r-lib.org/)
- [broom](https://broom.tidymodels.org/)
- [kableExtra](https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_html.html)
- [Bakeoff](https://bakeoff.netlify.app/)

