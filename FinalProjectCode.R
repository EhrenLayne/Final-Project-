# R file

library(readxl)
library(openxlsx)
library(tidyverse)


df <- read.xlsx("Marijuana_arrests_data.xlsx")

library(ggplot2)
ggplot(df, aes(x=inc_rate, y= per_black, fill=inc_rate)) +  
  geom_line()


head(df)
