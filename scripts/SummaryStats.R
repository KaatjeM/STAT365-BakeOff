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

write.table(viewership_summary, here("results/Table1.txt"))


paired_data <- ratings_new %>% 
  select(series, viewers_7day, finale) %>%
  group_by(series, finale) %>%
  summarize(avg_viewers = mean(viewers_7day)) %>%
  pivot_wider(id_cols = series,
              names_from = finale,
              values_from = avg_viewers
              )

### T-tests
# For p-value
# Paired
t.test(x = paired_data$`FALSE`, y = paired_data$`TRUE`, paired = T, alternative = "less")
# For CI
t.test(x = paired_data$`FALSE`, y = paired_data$`TRUE`, paired = T, alternative = "two.sided")
