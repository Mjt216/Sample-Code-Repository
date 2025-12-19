library(ggplot2)
library(plotly)
library(tidyverse)

asat_summary <- read.csv("asat_summary.csv")
asat_summary$test_date <- as.Date(asat_summary$test_date, format="%m/%d/%Y")

custom_color <- c("China" = "gold3", "Russia" = "firebrick", "USA" = "dodgerblue3", "India" = "darkgreen")

p <- ggplot(asat_summary, aes(x = test_date, y = total_debris, color = Country, size = total_debris, 
                              text = paste("Date:", test_date, "<br>Interceptor Type:", interceptor_type, "<br>Total Debris:", total_debris))) +
  geom_point() +
  scale_color_manual(values = custom_color) +
  ggtitle("Debris Created by ASAT Testing") +
  xlab("Test Date") +
  ylab("Debris Created") +
  scale_x_date(limits = as.Date(c('1959-01-01', '2023-12-31'))) +
  guides(size = FALSE)

fig <- ggplotly(p, tooltip = "text")  # Use only the 'text' tooltip

fig