# examine attrition by team, leader and group by month

# load packages
library(tidyverse)
library(cowplot)
library(dplyr)
library(scales)
library(lubridate)

# load data
terminations <- read_csv("data\\terminations.csv")

# convert date column from char to datae data type
terminations$month <- month(mdy(terminations$`Termination Date - All`), label = TRUE, abbr = FALSE)
str(terminations)
terminations
colnames(terminations)

terminations$month

L6s <- c("Smith, Brandee", 
         "Heeney, Mark", 
         "Guffey, Roger",
         "Bouillion, Gary",
         "Carle, Mindy",
         "Williams, Danielle",
         "Alamuru, Chai")
  
unique(terminations$L6.Mgr.Name)
L6s
str(L6s)

# change all character columns to factors
terminations <- as.data.frame(unclass(terminations), stringsAsFactors=TRUE)
terminations

# terminations by L6
# drop rows of non-GOPO
terminations <- terminations |> filter(L6.Mgr.Name %in% L6s)
terminations

unique(terminations$L6.Mgr.Name)

# all GOPO terminations
ggplot(terminations, aes(x = month, fill = L6.Mgr.Name)) +
  geom_bar() 
  
# select columns
colnames(terminations)
headers <- c("Employee.ID", "Termination.Month", "L6.Mgr.Name")
terminations_reduced <- terminations |> select(all_of(headers))

# terminations_reduced <- terminations |> select(all_of(headers), 
  # as.factor(terminations$"Termination Month", terminations$"L6 Mgr Name"))

# change all character columns to factors
terminations_reduced <- as.data.frame(unclass(terminations_reduced), stringsAsFactors=TRUE)
terminations_reduced

str(terminations_reduced)

# change data types to factor for chr
ggplot(terminations_reduced, aes(x = "L6 Mgr Name")) +
  geom_bar()

