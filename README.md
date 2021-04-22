# Poverty

#Summary 
The purpose of this data module project is to teach students how to tell stories based on poverty statistics and consider how politics can influence this reporting. Additionally, the students should learn some basic data managment techniques related to the Multidimensional Poverty Index and make presentations/visualizations based on that metadata. This data module is part of the collaborative effort of students at the LBJ School of Public Affairs at the University of Texas at Austin. Researchers tasked with creating the "Poverty" data module are Thomas Boswell, Nishat Tasnim, and Anne Ortman. 

#Work and Locations 
All work began in February 2021. All data and scripts used to aquire and clean the data can be found in the Global-Development-and-Politics-of-Data/poverty main repository. Data is located in the Data.Raw folder while scripts used in R to clean the data can be found in the Scripts folder. 

#Accompanying Materials
The Data Module has student facing and researcher/professor facing materials. All student facing materials will be found in the student folder of the poverty zip file. Go here to access the datasets necessary for the project. Those working on the data module should have first read Chapter 4 of the Global Development textbook as well as the Data Module manuscript that outlines key practices employed in our module creation process. 

#Instructions
There are a series of raw and tidied datasets in this repository. Raw datasets have a ".raw" designation and should not be saved over. You will be explicitly told when to save any datasets and will always use a new designation like "tidy" or "analysis" that you can add to the end of the file. 

Exercise #1 

You will be using the countries_pov_hc raw dataset found in the For Students/Data.raw folder. The variables names are fairly straightforward
Var 1 = country: This will be the country names in each of the observations. You will notice that the countries are named using the World Bank's naming conventions. Be aware of   this as you pick out countries for visualization and analysis 
Var 2 = year: Stands for the year for each observation 
Var 3 = pov_line: This is a categorical variable for the poverty headcount line. There are three categories of poverty lines. The first is dday which stands for dollar a day and  is the World Banks International Poverty LIne (Set at $1.90/day). The second is lmic which stands for the poverty line appropriate for lower middle income countries. This is set   at $3.20/day. The third is umic which is the poverty line appropriate for upper middle income countries. This is set at %5.50/day. 
Var 4 = headcount: This is a continuous variable that gives you the percentage of the population that lives below a given poverty line 
Var 5 = country_code: This is the ISO3 code which is a way to abreviate country names. This is a standardized way to abbreviate countries and is another way to identify           countries in the data set and can also be used as an identify key for merging data. 

This dataset has several NAs in the headcount column. Take a moment to consider the significance of these NAs. Notice how Afghanistan does not have a single value for their poverty headcount in any of the observations. We could remove these NAs altogether which would make visualization easier (for example making smooth trendlines). However, we chose to maintain the NAs so students can not only identify the data available, but notice what is unavailable. 

Exercise #2 

We do not provide a dataset for exercise #2, but we do have a copy of the preferred MPI dataset in our data.raw folder that can be accessed if necessary. The dataset provided in exercise 1 should serve as an example for an ideal dataset that we can use to create basic bar plots and trendline graphs that compare different values. Your task in exercise 2 is to find the data table online and provide some basic tidying techniques 

  
  
  
  
