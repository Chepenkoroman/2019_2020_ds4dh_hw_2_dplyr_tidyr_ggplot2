## task 2.2 dog names

library("tidyverse")

dog_names <- read.csv("https://raw.githubusercontent.com/r-classes/2019_2020_ds4dh_hw_2_dplyr_tidyr_ggplot2/master/data/dog_names.csv")

dog_names %>%
  tibble() %>%
  group_by(sex, age) %>%
  filter(sex != "Unknown") %>%
  count(age) %>%
  pivot_wider(names_from = sex, values_from = n) %>%
  relocate(Male, .after = age) -> t

t %>%
  mutate(Male = Male/sum(t$Male),
         Female = Female/sum(t$Female))
