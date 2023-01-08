# R file

library(readxl)
library(openxlsx)
library(tidyverse)
library(ggplot2)


df <- read.xlsx("Marijuana_arrests_data.xlsx")

ggplot(df, aes(x=inc_rate, y= per_black, fill=inc_rate)) +  
  geom_line()

ggplot(df, aes(x=inc_rate, y= per_black, fill=inc_rate)) +  
  geom_point()

head(df)
glimpse(df)
summary(df)

df <- read.xlsx("Marijuana_arrests_data.xlsx")

arrests <- lm(inc_rate ~ status + per_black, data=df)
summary(arrests) 

library(tidyr)

df %>% gather(name, vals) %>% unique()

df <- subset (df, select = -illegal)
df <- subset (df, select = -medicinal)

head(df)
