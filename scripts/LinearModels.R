# Packages
library(tidyverse)
library(here)
library(kableExtra)
library(broom)

# Load Data - Ratings Dataset
ratings <- read_csv(here("data/raw/ratings.csv"))

## Ratings subset for linear models
ratings_subset <- ratings|>
  filter(series <8)

## LINEAR MODELS
bakeoff_early_fit <- lm(viewers_7day ~ series, data = ratings_subset)

bakeoff_fit <- lm(viewers_7day ~ series, data = ratings)


## tbl-linear-model-comp-and-summary2 (Table 2)
reduced <- glance(bakeoff_early_fit)|>
  select(r.squared, p.value)|>
  mutate(
    type = "reduced", .before = "r.squared",
    r.squared = round(r.squared, digits = 3),
    intercept = round(bakeoff_early_fit$coefficients[1], digits = 3),
    slope = round(bakeoff_early_fit$coefficients[2], digits = 3)
    
  )

linear_model_comp_summary <- glance(bakeoff_fit)|>
  select(r.squared, p.value)|>
  mutate(
    type = "full", .before = "r.squared",
    r.squared = round(r.squared, digits = 3),
    intercept = round(bakeoff_fit$coefficients[1], digits = 3),
    slope = round(bakeoff_fit$coefficients[2], digits = 3)
  )|>
  full_join(reduced)|>
  mutate(p.value = scales::pvalue(p.value)) |>
  kable(
    caption = "Summary Statisitcs for Comparitive Linear Models",
    
  )

write.table(linear_model_comp_summary, here("results/Tablel2.txt"))