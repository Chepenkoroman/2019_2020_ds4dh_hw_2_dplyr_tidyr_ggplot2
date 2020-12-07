## task 2.1 dog names

library("tidyverse")

dog_names <- read.csv("https://raw.githubusercontent.com/r-classes/2019_2020_ds4dh_hw_2_dplyr_tidyr_ggplot2/master/data/dog_names.csv")

dog_names %>%
  group_by(sex) %>%
  filter(sex != "Unknown") %>%
  count(name) %>%
  top_n(20) %>%
  mutate(name = factor(name, levels = name)) %>%
  ggplot(aes(fct_reorder(name, n),n, name, fill = sex)) +
  geom_col() +
  facet_wrap(~sex, scales = "free_y") +
  coord_flip() +
  labs(x = "", y = "count",
       caption = "data from https://pudding.cool/2019/10/shelters") +
  scale_fill_brewer(palette = "Dark2")
#На всякий случай, была добавлена ссылка на источник (https://pudding.cool/2019/10/shelters)
