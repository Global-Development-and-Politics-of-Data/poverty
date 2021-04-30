#install libraries 

install.packages("ggthemes")
install.packages("viridis")

library(dplyr)
library(ggplot2)
library(ggthemes)
library(viridis)

#subset countries pov data to select Argentina 

argentina_povhc <- subset(countries_povhc_raw, country == "Argentina")

#remove NAs for smooth trendline 

argentina_povhc <- na.omit(argentina_povhc)

#create plot 

ggplot(argentina_povhc, aes(x=year, y = headcount, color = pov_line))+
  geom_line(size = 0.9)+
  ggtitle("Argentina's Poverty Headcount 1990-2019 by Poverty Lines")+
  theme_wsj()+
  labs(caption = "Source: World Bank World Development Indicators Database")

#create plot for Nigeria 

ggplot(subset(countries_povhc_raw, country == "Nigeria" & headcount != "NA"), 
       aes(year,headcount, ymin = 0, color = pov_line))+
      geom_line(size= 0.9)+
      ggtitle("Nigeria's Poverty Headcount 1992-2018 by Poverty Lines")+
      theme_fivethirtyeight()+
  labs(caption = "Source: World Bank World Development Indicators Database")

#subset Nigeria 

nigeria_povhc <- subset(countries_povhc_raw, country == "Nigeria")

#create plot for Bangladesh

ggplot(subset(countries_povhc_raw, country == "Bangladesh" & headcount != "NA"), 
       aes(year,headcount, ymin = 0, color = pov_line))+
  geom_line(size= 0.9)+
  ggtitle("Bangladesh's Poverty Headcount 1992-2018 by Poverty Lines")+
  theme_fivethirtyeight()+
  labs(caption = "Source: World Bank World Development Indicators Database")

#import regions 

library(readr)
subregions_povhc_raw <- read_csv("Data.Raw/subregions_povhc_raw.csv", 
                                   +     col_types = cols(headcount = col_number()))

#create a plot for World Poverty Progress by all Lines

ggplot(subset(subregions_povhc_raw, country == "World" & headcount != "NA"), 
       aes(year,headcount, ymin = 0, color = pov_line))+
  geom_line(size= 0.9)+
  ggtitle("Global Poverty Headcount 1990-2018 by Poverty Lines")+
  theme_fivethirtyeight()+
  labs(caption = "Source: World Bank World Development Indicators Database")

#save global plot

ggsave("Global_1990-2018_povhcs.pdf")

#create plot for World Poverty Progress only by IPL 

ggplot(subset(subregions_povhc_raw, country == "World" & headcount != "NA" & pov_line == "dday"), 
       aes(year,headcount, ymin = 0))+
  geom_line(size= 0.9, color = "blue")+
  ggtitle("Proportion of Global Population Living Below $1.90 (1990-2018)")+
  theme_fivethirtyeight()+
  labs(caption = "Source: World Bank World Development Indicators Database")

#save global plot for IPL

ggsave("Global_1990-2018_dday.pdf")


  

