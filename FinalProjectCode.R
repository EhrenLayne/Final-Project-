# R file

library(readxl)
library(openxlsx)
library(tidyverse)
library(ggplot2)


df <- read.xlsx("Marijuana_arrests_data.xlsx")

ggplot(df, aes(x=inc_rate, y= per_black, fill=inc_rate)) +  
  geom_line()


head(df)
