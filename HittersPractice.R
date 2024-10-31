setwd("/Users/jakeburns/Desktop/LAhman CSV SQL")
Hitters = read.csv('hitters.csv')


library(dplyr)
library(ggplot2)
library(tidyr)

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


high_k_thresh = quantile(Hitters$k_percent, 0.9, na.rm = TRUE) 
low_k_thresh = quantile(Hitters$k_percent, 0.1, na.rm = TRUE) 

high_k_player = Hitters %>% 
  filter(k_percent > high_k_thresh) %>% 
  select(last_name..first_name, k_percent) %>%
  arrange(desc(k_percent))

low_k_player = Hitters %>% 
  filter(k_percent < low_k_thresh) %>% 
  select(last_name..first_name, k_percent) %>%
  arrange(k_percent)

hitting_tendencies = Hitters %>%
  select(last_name..first_name, pull_percent, straightaway_percent, opposite_percent) %>%
  gather(key = "tendency", value = "percent", pull_percent, straightaway_percent, opposite_percent)

ggplot(hitting_tendencies, aes(x = tendency, y = percent, fill = tendency)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Hitting Tendencies (Pull, Straightaway, Opposite)",
       x = "Tendency",
       y = "Percentage") +
  theme_minimal()

ggplot(Hitters, aes(x = swing_percent, y = whiff_percent)) +
  geom_point(color = "purple") +
  geom_smooth(method = "lm", color = "darkblue") +
  labs(title = "Swing Percent vs Whiff Percent",
       x = "Swing Percent",
       y = "Whiff Percent")

