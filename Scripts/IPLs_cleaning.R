#install World Development Indicators Library

install.packages("WDI")

#call the WDI library 

library(WDI)
library(data.table)
library(dplyr)
library(ggplot2)

#download poverty headcount data at $1.90 

poverty_hc_dd_global = WDI(country = "all",
                           indicator = c("SI.POV.DDAY"),
                           start = 1990, end = 2019, extra = FALSE, cache = NULL)

#download poverty headcount data at $3.20

poverty_hc_lmic_global = WDI(country = "all",
                             indicator = c("SI.POV.LMIC"),
                             start = 1990, end = 2019, extra = FALSE, cache = NULL)

#download poverty headcount data at $5.50

poverty_hc_upmic_global = WDI(country = "all",
                              indicator = c("SI.POV.UMIC"),
                              start = 1990, end = 2019, extra = FALSE, cache = NULL)

#install tidy log package 

library(tidylog)

#first merge the dd and lmic datasets by the country variable and year

merged_data1 = left_join(poverty_hc_dd_global,poverty_hc_lmic_global,
                         by = c("country", "year"))

#remove the iso2c.y variable

merged_data1<- 
  merged_data1 %>% 
  select(-c(iso2c.y))

#merge the merged_data1 with the upmic datasets, call it all_ipls_global

all_ipls_global = left_join(merged_data1,poverty_hc_upmic_global,
                            by = c("country", "year"))

#remove the iso2c.x variable from the all_ipls_global dataset 

all_ipls_global<- 
  all_ipls_global %>% 
  select(-c(iso2c.x))

#reorder the all_ipls_global dataset by country code, country, year, and the three IPLs

all_ipls_global<-
  all_ipls_global[, c(5,1,3,2,4,6)]