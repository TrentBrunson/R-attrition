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
headers <- c{"Termination Month", "L6 Mgr Name"}
terminations_reduced <- terminations |> select(headers)
terminations_reduced
