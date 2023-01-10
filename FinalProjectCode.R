# R file
install.packages('rattle')
library('rattle')
library(readxl)
library(openxlsx)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(cluster)


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

#Copied from internet:
wssplot <- function(df, nc=15, seed=1234){
  wss <- (nrow(df)-1)*sum(apply(df,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(df, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(df.stand, nc=6) 


#Also copied:
clusplot(df.stand, k.means.fit$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)


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
