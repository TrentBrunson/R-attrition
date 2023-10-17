# examine attrition by team, leader and group by month

# load packages
library(tidyverse)
library(cowplot)
library(dplyr)
library(scales)

# load data
terminations <- read_csv("data\\terminations.csv")
terminations

# select columns
colnames(terminations)
headers <- c("Employee ID", "Termination Month", "L6 Mgr Name")
terminations_reduced <- terminations |> select(all_of(headers))

# terminations_reduced <- terminations |> select(all_of(headers), 
  # as.factor(terminations$"Termination Month", terminations$"L6 Mgr Name"))

# change all character columns to factors
terminations_reduced <- as.data.frame(unclass(terminations_reduced), stringsAsFactors=TRUE)
terminations_reduced

str(terminations_reduced)

# change data types to factor for chr
ggplot(terminations_reduced, aes(x = "L6 Mgr Name", y = "Employee ID")) +
  geom_bar(
    stat = "identity"
  )







ggplot(terminations_reduced, aes(x = "Termination Month", y = "L6 Mgr Name")) +
  geom_col()

ggplot(terminations_reduced, aes(x = "Termination Month")) +
  geom_bar()

ggplot(terminations_reduced, aes(x = "Termination Month")) +
  stat_count(geom = "line", aes(y = after_stat(count), group = 1))

ggplot(terminations_reduced, aes(x = "Termination Month")) +
  stat_count(aes(y = after_stat(count), group = 1)) +
  geom_line()

terminations_reduced |> 
  count("Termination Month") |> 
  ggplot(aes(x = "Termination Month")) +
  geom_line()

