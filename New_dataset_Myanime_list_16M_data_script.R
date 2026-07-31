library(tidyverse)
library(readr)
data_raw<-read_csv(file.choose())
data_raw
glimpse(data_raw)
final_anime_data<- data_raw %>% distinct() %>%
  mutate(
    anime_id = as.integer(anime_id),
    score = str_remove_all(score,'na'),
    score = as.integer(score),
    episodes_seen = str_remove_all(episodes_seen,'na'),
    episodes_seen = as.integer(episodes_seen)
  ) %>% filter(score > 0 & episodes_seen > 0) %>%
  group_by(status) %>%
  summarise(
    Total_Score = sum(score),
    Total_Episodes_seen = sum(episodes_seen),
    Total_Anime = n(),
    .groups = 'drop'
  ) %>% arrange(desc(Total_Score))
final_anime_data
write.csv(final_anime_data,
          'New_dataset_Myanime_list_1.6B_data.csv',
          row.names = FALSE)
getwd()
