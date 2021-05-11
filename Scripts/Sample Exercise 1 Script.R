#call ggplot2 library 

library(ggplot2)

#subset for china and latest year in dataset

china_povhc_raw <- subset(countries_povhc_raw, country == "China" & year == 2016)

#create a bar plot for china's poverty headcounts in 2016 at the three different lines in the dataset, y = headcount, x = year, fill = pov_line

ggplot(china_povhc_raw, aes(x=year, y = headcount, fill = pov_line))+
  geom_bar(stat = "identity", position = "dodge")+
  scale_x_continuous(breaks = 0:2100)+
  ggtitle("China's Poverty Headcount by Poverty Line Threshold(2016)")+
  geom_text(aes(label = headcount), vjust = -0.2, size = 5,
            position = position_dodge(0.9))

#save plot 

ggsave("china_2016_povhcs.png")





