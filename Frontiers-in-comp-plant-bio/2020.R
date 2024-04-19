setwd("~/Desktop/Classes/Frontiers/weather-witches/2020")
weather_data_uncleaned <- read.csv("2020weather.csv", skip = 1, header = FALSE)

# Rename the columns correctly
colnames(weather_data_uncleaned) <- c("Timestamp", "Date", "PlantingDate", "DaysAfterPlanting",
                                      "WeeksAfterPlanting", "WaterScoutSM100", "SoilTemperatureF",
                                      "PARLight", "RelativeHumidity", "AirTemperatureF",
                                      "RainfallIn", "WindDirection", "WindGustMph", "WindSpeedMph")

# Ensure 'RainfallIn' is numeric
weather_data_uncleaned$RainfallIn <- as.numeric(as.character(weather_data_uncleaned$RainfallIn))

# Handle possible NA values after conversion
weather_data_uncleaned$RainfallIn[is.na(weather_data_uncleaned$RainfallIn)] <- 0

# Calculate total rainfall per week
weekly_rainfall <- weather_data_uncleaned %>%
  group_by(WeeksAfterPlanting) %>%
  summarize(WeeklyRainfall = sum(RainfallIn, na.rm = TRUE))

# Add the weekly rainfall totals back to the original dataframe
# This assumes that 'WeeksAfterPlanting' is already in the correct numeric format
weather_data_with_weekly_totals <- weather_data_uncleaned %>%
  left_join(weekly_rainfall, by = "WeeksAfterPlanting")

# View the dataframe to verify the new column
head(weather_data_with_weekly_totals)

weather_data_uncleaned$AirTemperatureF <- as.numeric(as.character(weather_data_uncleaned$AirTemperatureF))

# Handle possible NA values after conversion
weather_data_uncleaned$AirTemperatureF[is.na(weather_data_uncleaned$AirTemperatureF)] <- 0

# Calculate daily average temperature
daily_avg_temp <- weather_data_uncleaned %>%
  group_by(Date) %>%
  summarize(DailyAvgTemp = mean(AirTemperatureF, na.rm = TRUE))

# Calculate the average of the daily averages for a weekly average temperature
weekly_avg_temp <- daily_avg_temp %>%
  left_join(weather_data_uncleaned, by = "Date") %>%
  group_by(WeeksAfterPlanting) %>%
  summarize(WeeklyAvgTemp = mean(DailyAvgTemp, na.rm = TRUE))

# Add the weekly average temperatures back to the original dataframe
weather_data_with_weekly_avg_temp <- weather_data_uncleaned %>%
  left_join(weekly_avg_temp, by = "WeeksAfterPlanting")

# View the dataframe to verify the new column
head(weather_data_with_weekly_avg_temp)

weather_data_with_weekly_totals$AirTemperatureF <- as.numeric(as.character(weather_data_with_weekly_totals$AirTemperatureF))

# Handle possible NA values after conversion
weather_data_with_weekly_totals$AirTemperatureF[is.na(weather_data_with_weekly_totals$AirTemperatureF)] <- 0

# Now perform the inner join again
weather_data_combined <- weather_data_with_weekly_avg_temp %>%
  inner_join(weather_data_with_weekly_totals, by = c("Timestamp", "Date", "PlantingDate", "DaysAfterPlanting",
                                                     "WeeksAfterPlanting", "SoilTemperatureF",
                                                     "AirTemperatureF", "RainfallIn"))

# View the combined dataframe to verify the results
head(weather_data_combined)
write.csv(weather_data_combined, "weekly.csv")
