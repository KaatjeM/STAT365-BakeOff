#Load data from Data Cleaning
library(here)
library(kableExtra)
source(here("scripts/DataCleaning.R"))

## Summary Stats for Q1
non<- non_finale_episodes|>
  summarise(
    type = "Non Finale Episodes",
    mean = round(mean(viewers_7day), digits = 3),
    sd = round(sd(viewers_7day), digits = 3),
    median = round(median(viewers_7day), digits = 3),
    q1 = round(quantile(viewers_7day,probs = .25), digits = 3),
    q3 = round(quantile(viewers_7day,probs = .75), digits = 3),
    observations = n()
  )

fin <- finale_episodes|>
  summarise(
    type = "Finale Episodes",
    mean = round(mean(viewers_7day), digits = 3),
    sd = round(sd(viewers_7day), digits = 3),
    median = round(median(viewers_7day), digits = 3),
    q1 = round(quantile(viewers_7day,probs = .25), digits = 3),
    q3 = round(quantile(viewers_7day,probs = .75), digits = 3),
    observations = n()
  )

## tbl-finale-viewership-summary (Table 1)
viewership_summary <- non |>
  full_join(fin)|>
  kable(
    format = "pipe",
    align = "l",
    caption = "Summary Stats for Non Finale and Finale Episodes"
  )