# R file
library(readxl)
library(openxlsx)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(cluster)
library(dplyr)

df <- read.xlsx("weed_data.xlsx")
df <- subset (df, select = -Illegal)
df <- subset (df, select = -Medicinal)

#K-means clustering:

df.stand <- scale(df[-1])
k.means.fit <- kmeans(df.stand, 3)

#Centroids:
k.means.fit$centers
#Clusters:
k.means.fit$cluster 
#Cluster sizes:
k.means.fit$size

wssplot <- function(df, nc=15, seed=1234){
  wss <- (nrow(df)-1)*sum(apply(df,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(df, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(df.stand, nc=6) 

clusplot(df.stand, k.means.fit$cluster, main='2D representation of the Cluster solution',
         color=TRUE, shade=TRUE,
         labels=2, lines=0)

ggplot(df, aes(x=Police_Expend, y= Black_Inc_Rate, fill=Police_Expend)) +  
  geom_line()

ggplot(df, aes(x=Per_Black, y= Black_Inc_Rate, fill=Per_Black)) +  
  geom_point()

head(df)
summary(df)

arrests <- lm(Black_Inc_Rate ~ Status + Per_Black, data=df)
summary(arrests) 
