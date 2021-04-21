#install World Development Indicators Library

install.packages("WDI")
install.packages("data.table")
install.packages("dplyr")
install.packages("tidyr")
install.packages("tidylog")

#call the necessary libraries 

library(WDI)
library(data.table)
library(dplyr)
library(tidyr)
library(tidylog)

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
                         by = c("country", "year", "iso2c"))

#merge the merged_data1 with the upmic datasets, call it all_ipls_global

all_ipls_global = left_join(merged_data1,poverty_hc_upmic_global,
                            by = c("country", "year", "iso2c"))

#remove the iso2c.x and the iso2c variable from the all_ipls_global dataset 

all_ipls_global<- 
  all_ipls_global %>% 
  select(-c(iso2c))

#reorder the all_ipls_global dataset by country code, country, year, and the three IPLs

all_ipls_global<-
  all_ipls_global[, c(1,3,2,4,5)]

#rename the SI.POV.DDAY, SI.POV.LMIC, SI.POV.UMIC to remove the "SI.POV."

setnames(all_ipls_global, "SI.POV.DDAY", "pov.dday")
setnames(all_ipls_global, "SI.POV.LMIC", "pov.lmic")
setnames(all_ipls_global, "SI.POV.UMIC", "pov.umic")

#create a long table to place the three column names we just created into a single column under the variable "pov_line"

ipls_global_long <- 
  all_ipls_global %>%
  pivot_longer(
    cols = starts_with("pov"),
    names_to = "pov_line",
    names_prefix = "pov.",
    values_to = "headcount"
  )

#create a copy of ipls_global_long and call to global_poverty_raw

global_poverty_raw <- ipls_global_long

#export global_poverty_raw to Poverty repository 

write.csv(global_poverty_raw,"C:\\Users\\thoma\\OneDrive\\Desktop\\poverty_viz\\Poverty\\global_poverty_raw.csv", row.names = FALSE)


