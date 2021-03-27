#Remove old data sets 

rm(poverty_hc_dd_global)
rm(poverty_hc_upmic_global)
rm(poverty_hc_lmic_global)
rm(merged_data1)

#apply iso3c codes 

library(countrycode)

all_ipls_global$country_code = countrycode(sourcevar = all_ipls_global$country, origin = "country.name", destination = "iso3c", warn = TRUE)

#separate the non-country and country data

library(dplyr)

all_ipls_countries <-
  all_ipls_global %>%
  dplyr::filter(!(country_code == "NA"))

rm(all_ipls_ncountry)
rm(all_ipls_noncountry)

#create an income brackets dataset 

ipls_brackets <- subset(all_ipls_global, country == "Low income" | country == "High income" | country == 
                          "Lower middle income" | country == "Upper middle income")

#create a subregion dataset 

ipls_regions <- subset(all_ipls_global, country == "East Asia & Specific" | country == "Europe and Central Asia" | 
                         country == "Latin America and Caribbean" | country == "Middle East & North Africa" |
                         country == "South Asia" | country == "Sub-Saharan Africa" | country == "World")


#export subsetted data 

write.csv(all_ipls_countries,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\all_ipls_countries.csv", row.names = FALSE)
write.csv(ipls_brackets,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\ipls_brackets.csv", row.names = FALSE)
write.csv(ipls_regions,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\ipls_regions.csv", row.names = FALSE)
