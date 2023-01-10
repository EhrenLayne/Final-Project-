# R file
install.packages('rattle')
library('rattle')
library(readxl)
library(openxlsx)
library(tidyverse)
library(ggplot2)
library(tidyr)


df <- read.xlsx("Marijuana_arrests_data.xlsx")

#K-means clustering:

df.stand <- scale(df[-1])
k.means.fit <- kmeans(df.stand, 3)

#Centroids:
k.means.fit$centers #Centroids:
#Clusters:
k.means.fit$cluster 
#Cluster sizes:
k.means.fit$size



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


df %>% gather(name, vals) %>% unique()

df <- subset (df, select = -illegal)
df <- subset (df, select = -medicinal)

head(df)
