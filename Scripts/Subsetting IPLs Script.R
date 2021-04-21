#import the global_poverty_raw.csv file into the environment (found in Data.raw folder)

library(readr)
global_poverty_raw <- read_csv("Data.Raw/global_poverty_raw.csv")

#apply iso3c codes 

library(countrycode)

global_poverty_raw$country_code = countrycode(sourcevar = global_poverty_raw$country, origin = "country.name", destination = "iso3c", warn = TRUE)

#separate the non-country and country data, name country dataset countries_povhc_raw

library(dplyr)

countries_povhc_raw <-
  global_poverty_raw %>%
  dplyr::filter(!(country_code == "NA"))


#create an income brackets dataset, call it brackets_povhc_raw 

brackets_povhc_raw <- subset(global_poverty_raw, country == "Low income" | country == "High income" | country == 
                          "Lower middle income" | country == "Upper middle income")

#create a subregion dataset, call it subregion_povhc_raw 

subregion_povhc_raw <- subset(global_poverty_raw, country == "East Asia & Pacific" | country == "Europe & Central Asia" | 
                         country == "Latin America & Caribbean" | country == "Middle East & North Africa" |
                         country == "South Asia" | country == "Sub-Saharan Africa" | country == "World")


#export subsetted data 

write.csv(countries_povhc_raw,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\countries_povhc_raw.csv", row.names = FALSE)
write.csv(subregion_povhc_raw,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\subregions_povhc_raw.csv", row.names = FALSE)
write.csv(brackets_povhc_raw,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\brackets_povhc_raw.csv", row.names = FALSE)
