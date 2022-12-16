#initializations
pbp2022 = data.frame()

#get cubs game codes
cubs <- mlb_schedule(2022) %>% 
  filter(series_description == "Regular Season",
         status_detailed_state == "Final" | status_detailed_state == "Completed Early",
         teams_home_team_name == "Chicago Cubs" | teams_away_team_name == "Chicago Cubs")
a <- cubs$game_pk

#scraping data [THIS TAKES A BIT TO RUN]
for(i in 1:length(a)){
  temp_table = mlb_pbp(a[i]) %>% 
    filter(details.isInPlay == TRUE)
  pbp2022 = rbind(pbp2022, temp_table, fill=TRUE)
}

saveRDS(pbp2022, file = "data.rds")