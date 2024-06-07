#Load data from Data Cleaning
library(here)
source(here("scripts/DataCleaning.R"))


## fig-finale-viewership-plot (Figure 1)
viewership_plot <- ratings_new|>
  ggplot(mapping = aes(x = factor(series)))+
  geom_jitter(mapping = aes(y = viewers_7day, color = finale, shape = finale),
              width = 0.2, height = 0, weight = 4, show.legend = FALSE)+
  theme_bw()+
  annotate(
    "text", x = 6.5, y = 6, label = "Finale episodes marked with\nyellow triangles. Non-finale\nepisodes are blue circles."
  )+
  labs(
    x = "Series",
    y = "Viewership (in millions of views)", #look at this later alie and see if you still want a y-axis label
    subtitle = "Finale Episodes see larger viewership over 7 days than Non-Finale Episodes",
    title = "Tuning In When There's No Next Week: Finales tend to see \nHigher Viewership"
  )+
  scale_color_manual(values = c("steelblue", "goldenrod3"))



## fig-linear-model-viewership-plot (Figure 2)
model_viewership_plot <- ratings |>
  ggplot(mapping = aes(x = factor(series), y = viewers_7day))+
  geom_jitter(width = 0.2, height = 0, shape = 1)+
  geom_abline(
    slope = 1.97278, intercept = -0.08880, col = "steelblue", linetype = "dashed", linewidth = 1
  )+
  geom_abline(
    slope = 0.76636, intercept = 4.16083, col = "goldenrod3", linewidth = 1
  )+
  theme_bw()+
  labs(
    x = "Series",
    y = "Viewership (in millions of views)",
    subtitle = "Note: Our Linear Models have been projected over this graph for contrast",
    title = "Viewership after 7 days of Episode Release by Series with Linear Models"
  )