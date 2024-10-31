Hitters = read.csv('hitters.csv')


library(dplyr)

high_k_percent = Hitters %>%
  arrange(desc(k_percent)) %>% head(5)

low_k_percent = Hitters %>% 
  arrange(k_percent) %>% head(5)

high_bb_percent = Hitters %>% 
  arrange(desc(bb_percent)) %>% head(5)

low_bb_percent = Hitters %>%
  arrange(bb_percent) %>% head(5)

top_power_hitters = Hitters %>% 
  arrange(desc(barrel_batted_rate), desc(hard_hit_percent)) %>%
  select(last_name..first_name, barrel_batted_rate, hard_hit_percent) %>% 
  head(5)


library(ggplot2)

#Relationship between Swing Speed and Slugging 

ggplot(Hitters, aes(x = avg_swing_speed, y = xslg)) + 
  geom_point() + 
  geom_smooth(method = "lm", col = "red") + 
  labs(title = "Swing Speed vs Expected Slugging %",
       x = "Avg Swing Speed", y = "Expected SLG%")

Feidling_tendencies = Hitters %>% 
  select(last_name..first_name, pull_percent, straightaway_percent, opposite_percent) %>%
  arrange(desc(pull_percent)) %>% 
  head(5)

Barrel_control = Hitters %>%
  arrange(desc(sweet_spot_percent)) %>%
  select(last_name..first_name, sweet_spot_percent) %>%
  	head(5)

Age_Exit_velo = Hitters %>% 
  group_by(player_age) %>%
  summarize(exit_velocity_avg = mean(exit_velocity_avg, na.rm = TRUE))

ggplot(Age_Exit_velo, aes(x = player_age, y = exit_velocity_avg)) + 
  geom_line() + 
  geom_point() + 
  labs(title = "Avg Exit Velo By Age ", x = "Player Age", y = "Avg Exit Velo")
  

