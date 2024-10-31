setwd("/Users/jakeburns/Desktop/LAhman CSV SQL")

Pitchers =read.csv("2024Pitch.csv")

library(ggplot2)
library(dplyr)
library(caret)


ggplot(Pitchers, aes(x = arm_angle, y = k_percent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "K% vs. Arm Angle", x = "Arm Angle (degrees)", y = "Strikeout Percentage (%)")

ggplot(Pitchers, aes(x = arm_angle, y = bb_percent)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "BB% vs. Arm Angle", x = "Arm Angle (degrees)", y = "Walk Percentage (%)")

model_kpercent <- lm(k_percent ~ arm_angle, data = Pitchers)
summary(model_kpercent)
#The analysis indicates that arm_angle does not have a statistically significant effect on k_percent. 
#The model explains almost none of the variance in the response variable, indicating that other factors 
#likely influence strikeout percentage. Overall, there is little evidence to support a relationship between 
#arm angle and strikeout percentage based on this analysis. 

model_bbpercent <- lm(bb_percent ~ arm_angle, data = Pitchers)
summary(model_bbpercent)

#Overall, the analysis suggests that arm_angle does not have a statistically significant effect on 
#bb_percent. The model explains very little of the variance in the response variable, and there may 
#be other factors influencing bb_percent that are not included in this analysis.

ggplot(Pitchers, aes(x = arm_angle, y = xwoba)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "xWOBA vs. Arm Angle", x = "Arm Angle (degrees)", y = "Xwoba")

model_xwoba <- lm(xwoba ~ arm_angle, data = Pitchers)
summary(model_xwoba)
#The analysis indicates that arm_angle has a weak but potentially positive effect on xwOBA, as indicated 
#by the marginally significant coefficient. However, the overall model explains very little of the variance 
#in xwOBA, suggesting that other factors likely influence expected weighted on-base average. The relationship 
#observed may warrant further investigation, potentially with additional predictors included in the model.

ggplot(Pitchers, aes(x = arm_angle, y = fastball_avg_speed)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Pitch Velocity vs. Arm Angle",
       x = "Arm Angle (degrees)",
       y = "Fastball Average Speed (mph)") +
  theme_minimal()

model_velo <- lm(fastball_avg_speed ~ arm_angle, data = Pitchers)
summary(model_velo)
#The analysis indicates a significant positive relationship between arm_angle and fastball_avg_speed, 
#suggesting that as the arm angle increases, fastball speed tends to increase as well. Although the R-squared 
#value is low, the statistical significance of the arm_angle coefficient suggests that it is a relevant predictor 
#for fastball speed. Further analysis might explore additional factors that could explain more variance in fastball 
#speed or the interactions between multiple predictors

ggplot(Pitchers, aes(x = arm_angle, y = groundballs_percent)) +
  geom_point(alpha = 0.5) +
  geom_smooth(method = "lm", col = "blue") +
  labs(title = "Ground Ball Rate vs. Arm Angle",
       x = "Arm Angle (degrees)",
       y = "Ground Ball Rate (%)") +
  theme_minimal()

model_gb <- lm(groundballs_percent ~ arm_angle, data = Pitchers)
summary(model_gb)
#The analysis indicates a significant negative relationship between arm_angle and groundballs_percent, 
#suggesting that as the arm angle increases, the percentage of ground balls decreases. Although the R-squared 
#value indicates that a relatively small proportion of the variance in ground ball percentage is explained by 
#arm angle, the statistical significance of the coefficient indicates that arm angle is a relevant predictor. 
#Further research could explore additional variables that might influence ground ball rates or the interactions 
#between arm angle and other pitching mechanics.

Pitchers$fast_avg_horizontal_break = abs(Pitchers$fastball_avg_break_x)

ggplot(Pitchers, aes(x = arm_angle, y = fast_avg_horizontal_break)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  labs(title = "Arm Angle vs. Average Fastball Break",
       x = "Arm Angle (degrees)",
       y = "Fastball Average Break (inches)") +
  xlim(20, 70) + 
  theme_minimal()

model_FHB <- lm(fast_avg_horizontal_break ~ arm_angle, data = Pitchers)
summary(model_FHB)


