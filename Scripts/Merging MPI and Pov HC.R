#call useful libraries 

install.packages("ggpubr")

library(WDI)
library(data.table)
library(dplyr)
library(tidyr)
library(tidylog)
library(stargazer)

#import countries_povhc_raw dataset 

read.csv(....)

#import mpi raw dataset 

library(readxl)
mpi_hc_raw <- read_excel("mpi_hc_raw.xlsx", 
                           +     col_types = c("numeric", "text", "text", 
                                               +         "text", "text", "numeric", "numeric"))

#change the year_published variable in mpi_hc_raw to year

setnames(mpi_hc_raw, "year_published", "year")

#remove columns so only year, country, country code, and mpi headcount remain 

mpi_hc_raw<- 
  mpi_hc_raw %>% 
  select(-mpi, -year_data, -survey,)

#subset countries_povhc data so that it only has the IPL data 

countries_ipl <- subset(countries_povhc_raw, pov_line == "dday")

#merge mpi and ipl data by country code 

mpi_povhc_merged = left_join(countries_ipl,mpi_hc_raw,
                         by = c("country", "year", "country_code"))

#subset for data only available in both mpi and povhc 

mpi_ipl_only <- 
  subset(mpi_povhc_merged, headcount != "NA" & mpi_headcount != "NA")

#add continents label using the iso2c 

library(countrycode)

mpi_ipl_only$continent <- countrycode(sourcevar = mpi_ipl_only$country, origin = "country.name", 
                                     destination = "continent", warn = TRUE)

# create a histogram of the years 

ggplot(mpi_ipl_only, aes(x=year))+
  geom_histogram()

# create scatterplot to compare MPI and HC 

ggplot(subset(mpi_ipl_only, headcount != 0 & mpi_headcount != 0), aes(mpi_headcount,headcount,color=continent))+
  geom_point()

#create scatterplot to compare HC and MPI 

ggplot(mpi_ipl_only, aes(headcount, mpi_headcount, color = continent))+
  geom_point()

#create scatterplot with correlation line of mpi_headcount and headcount 

library("ggpubr")
ggscatter(mpi_ipl_only, x = "mpi_headcount", y = "headcount", color= "continent", 
          add = "reg.line", conf.int = TRUE, 
          cor.coef = TRUE, cor.method = "pearson",
          ylab = "Population living Below IPL (%)", xlab = "Population Living in Multidimensional Poverty (%)")+
  ggtitle("Correlation between MPI and Consumption Poverty 2010-2018" )



