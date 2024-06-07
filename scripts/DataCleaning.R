# Packages
library(tidyverse)
library(here)

# Load Data - Ratings Dataset
ratings <- read_csv(here("./data/raw/ratings.csv"))


## ADDING INDICATOR VARIABLE for finale
finale_episodes <- ratings|>
  group_by(series)|>
  slice_max(order_by = episode)|>
  ungroup()|>
  mutate(
    finale = TRUE
  )

non_finale_episodes <- ratings |>
  anti_join(finale_episodes)|>
  mutate(
    finale = FALSE
  )

ratings_new <- non_finale_episodes |>
  full_join(finale_episodes)|>
  mutate(
    finale = as.character(finale)
  )

## Save Datasets to data folder
write.csv(ratings_new, here("./data/modified/ratings_new.csv"))
write.csv(finale_episodes, here("./data/modified/finale_episodes.csv"))
write.csv(non_finale_episodes, here("./data/modified/non_finale_episodes.csv"))