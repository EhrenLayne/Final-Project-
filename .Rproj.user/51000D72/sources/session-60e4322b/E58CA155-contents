# R file
install.packages("ggmcmc")
library(readxl)
library(openxlsx)
library(tidyverse)
library(ggplot2)
library(tidyr)
library(cluster)
library(dplyr)
library(brms)
library(ggridges)
library(shinystan)
library(bayesplot)
library(tidybayes)
library(ggmcmc)


data(iris)

df <- read.xlsx("weed_data.xlsx")
df <- subset (df, select = -Illegal)
df <- subset (df, select = -Medicinal)
df <- subset (df, select = -Sales_Expend)
df <- subset (df, select = -Sales_Arrests)
df <- subset (df, select = -Judicial_Expend)
df <- subset (df, select = -Corrections_Expend)
head(df)

WhiteIncRate = df[,2]
print(WhiteIncRate)
BlackIncRate = df[,3]
print(BlackIncRate)

# Line Plot of police expenditure vs. the black incarceration rate
Line <- ggplot(df, aes(x=Police_Expend, y= Black_Inc_Rate, fill=Police_Expend)) +  
  geom_line()
Line <- Line + labs(title = "Line plot of the black incarceration rate vs. police expenditure in each state")
Line

# Line Plot:
Line <- ggplot(df, aes(x=Police_Expend, y= Black_Inc_Rate, fill=Police_Expend)) +  
  geom_line()
Line <- Line + labs(title = "Line plot of the black incarceration rate vs. police expenditure in each state")
Line

# Scatter Plot:
Scatter <- ggplot(df, aes(x=Per_Black, y= Black_Inc_Rate),color = class) +  
  geom_point()
Scatter <- Scatter + labs(title = "Scatter plot of the black incarceration rate vs. percent of the population that is black")
Scatter

summary(df)

arrests <- lm(Black_Inc_Rate ~ Police_Expend + Per_Black, data=df)
summary(arrests)

# Residual Plot:
res <- resid(arrests)
plot(fitted(arrests), res)
abline(0,0)

# Box Plot of each State's police expenditure:
box_plot <- ggplot(df, aes(x = Police_Expend, y = States))
box_plot +
  geom_boxplot()

# Line plot of police expenditure against the black incarceration rates
BlackvsPoliceExp <- ggplot(df, aes(x=Police_Expend, y= WhiteIncRate, fill=States, group = 1)) +  
  geom_line()
BlackvsPoliceExp

