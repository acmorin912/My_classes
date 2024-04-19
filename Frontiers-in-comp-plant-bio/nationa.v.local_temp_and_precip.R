library(readxl)
library(ggpubr)
colors_temp <- c("National" = "firebrick4", "Local" = "salmon")
colors_rain<- c("National" = "dodgerblue4", "Local" = "turquoise3")

setwd("~/Desktop/Classes/Frontiers/weather-witches/2020")

weather_2020<- read_xlsx("National_Weather_2020.xlsx")
names(weather_2020)

library(ggplot2)

# Create a ggplot for temperature
temp_2020 <- ggplot(data = weather_2020, aes(x = Week)) +
  geom_line(aes(y = Average_Temp_National, color = "National")) +
  geom_line(aes(y = Average_Temp_Local, color = "Local")) +
  labs(title = "Temp Comparison 2020", x = "Week", y = "Temperature (f)") +
  scale_color_manual(values = colors_temp,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2020$Week), by = 1)) +
  theme_minimal() +
  guides(color = guide_legend(title = "", position = "top"))
temp_2020
# Create a ggplot for rainfall
rain_2020 <- ggplot(data = weather_2020, aes(x = Week)) +
  geom_line(aes(y = Sum_Rainfall_National., color = "National")) +
  geom_line(aes(y = Sum_Rainfall_Local, color = "Local")) +
  labs(title = "Rain Comparison 2020", x = "Week", y = "Rainfall (in)") +
  scale_color_manual(values = colors_rain,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2020$Week), by = 1)) +
  theme_minimal() +
  guides(color = guide_legend(title = "", position = "top"))
rain_2020

all_2020<-ggarrange(temp_2020,rain_2020, ncol=2,nrow=1)
all_2020


#2021
setwd("~/Desktop/Classes/Frontiers/weather-witches/2021")

weather_2021<- read_xlsx("National_Weather_2021.xlsx")
names(weather_2021)
temp_2021 <- ggplot(data = weather_2021, aes(x = Week)) +
  geom_line(aes(y = Average_Temp_National, color = "National")) +
  geom_line(aes(y = Average_Temp_Local, color = "Local")) +
  labs(title = "Temp Comparison 2021", x = "Week", y = "Temperature (f)") +
  scale_color_manual(values = colors_temp,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2021$Week), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position = "none") # Hide the legend
temp_2021
# Create a ggplot for rainfall
rain_2021 <- ggplot(data = weather_2021, aes(x = Week)) +
  geom_line(aes(y = Sum_Rainfall_National, color = "National")) +
  geom_line(aes(y = Sum_Rainfall_Local, color = "Local")) +
  labs(title = "Rain Comparison 2021", x = "Week", y = "Rainfall (in)") +
  scale_color_manual(values = colors_rain,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2021$Week), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position = "none") # Hide the legend
rain_2021

all_2021<-ggarrange(temp_2021,rain_2021, ncol=2,nrow=1)
all_2021

#2022
setwd("~/Desktop/Classes/Frontiers/weather-witches/2022")

weather_2022<- read_xlsx("National_Weather_2022.xlsx")
names(weather_2022)
temp_2022 <- ggplot(data = weather_2022, aes(x = Week)) +
  geom_line(aes(y = Average_Temp_National, color = "National")) +
  geom_line(aes(y = Average_Temp_Local, color = "Local")) +
  labs(title = "Temp Comparison 2022", x = "Week", y = "Temperature (f)") +
  scale_color_manual(values = colors_temp,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2022$Week), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position = "none") # Hide the legend
temp_2022
# Create a ggplot for rainfall
rain_2022 <- ggplot(data = weather_2022, aes(x = Week)) +
  geom_line(aes(y = Sum_Rainfall_National, color = "National")) +
  geom_line(aes(y = Sum_Rainfall_Local, color = "Local")) +
  labs(title = "Rain Comparison 2022", x = "Week", y = "Rainfall (in)") +
  scale_color_manual(values = colors_rain,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2022$Week), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position = "none") # Hide the legend
rain_2022

all_2022<-ggarrange(temp_2022,rain_2022, ncol=2,nrow=1)
all_2022

#2023
setwd("~/Desktop/Classes/Frontiers/weather-witches/2023")

weather_2023<- read_xlsx("National_Weather_2023.xlsx")
names(weather_2023)
temp_2023 <- ggplot(data = weather_2023, aes(x = Week)) +
  geom_line(aes(y = Average_Temp_National, color = "National")) +
  geom_line(aes(y = Average_Temp_Local, color = "Local")) +
  labs(title = "Temp Comparison 2023", x = "Week", y = "Temperature (f)") +
  scale_color_manual(values = colors_temp,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2023$Week), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position = "none") # Hide the legend
temp_2023
# Create a ggplot for rainfall
rain_2023 <- ggplot(data = weather_2023, aes(x = Week)) +
  geom_line(aes(y = Sum_Rainfall_National, color = "National")) +
  geom_line(aes(y = Sum_Rainfall_Local, color = "Local")) +
  labs(title = "Rain Comparison 2023", x = "Week", y = "Rainfall (in)") +
  scale_color_manual(values = colors_rain,
                     name = "Type",
                     labels = c("National", "Local")) +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(breaks = seq(1, max(weather_2023$Week), by = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5), 
        legend.position = "none") # Hide the legend
rain_2023

all_2023<-ggarrange(temp_2023,rain_2023, ncol=2,nrow=1)
all_2023

#Combine all
all_years<- ggarrange(all_2020,all_2021,all_2022,all_2023, nrow=4, ncol=1)
all_years
