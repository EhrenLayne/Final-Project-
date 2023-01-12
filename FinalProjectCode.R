# R file
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
library(faraway)
library(MASS)
library(gridExtra)

data(iris)

df <- read.xlsx("weed_data.xlsx")
df <- subset (df, select = -Illegal)
df <- subset (df, select = -Medicinal)
df <- subset (df, select = -Sales_Expend)
df <- subset (df, select = -Sales_Arrests)
df <- subset (df, select = -Judicial_Expend)
df <- subset (df, select = -Corrections_Expend)




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
  geom_point() +
  geom_smooth(method=lm, se=FALSE, linetype='dashed')

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
BlackvsPoliceExp1 <- ggplot(df, aes(x=Police_Expend, y= Black_Inc_Rate, fill=States, group = 1)) +  
  geom_line()
BlackvsPoliceExp1 <- BlackvsPoliceExp1 + labs(title = "Line plot of the black incarceration rate vs. police expenditure")
BlackvsPoliceExp1

# Line plot of police expenditure against the white incarceration rates
WhitevsPoliceExp1 <- ggplot(df, aes(x=Police_Expend, y= White_Inc_Rate, fill=States, group = 1)) +  
  geom_line()
WhitevsPoliceExp1 <- WhitevsPoliceExp1 + labs(title = "Line plot of the white incarceration rate vs. police expenditure")
WhitevsPoliceExp1

# t, p-value, 95% confidence interval:
t.test(df$Black_Inc_Rate, df$White_Inc_Rate, correct=FALSE)

df <- na.omit(df)

head(df)

ggplot(df, aes(x = Status, y = Per_Black, fill="Black_Inc_Rate")) + 
  geom_col(fill = "#0099f9", width =0.5)


# Logit regression:
fit <- glm(Status~Black_Inc_Rate+Per_Black+Police_Expend+`Weed_Prohibition_Bil$`+Possession_Expend,data=df,family=binomial()) 
summary(fit)

fit <- glm(Status~White_Inc_Rate+Police_Expend+`Weed_Prohibition_Bil$`+Possession_Expend,data=df,family=binomial()) 
summary(fit)

# Poisson Regression;

fit <- glm(Black_Inc_Rate~Status+Per_Black+Police_Expend+`Weed_Prohibition_Bil$`+Possession_Expend,data=df,family=poisson()) 
summary(fit)

fit <- glm(White_Inc_Rate~Status+Police_Expend+`Weed_Prohibition_Bil$`+Possession_Expend,data=df,family=poisson()) 
summary(fit)

# Quasibinomial Regression:
fit <- glm(Status~Black_Inc_Rate+Per_Black+Police_Expend+`Weed_Prohibition_Bil$`+Possession_Expend,,data=df,family=quasibinomial()) 
summary(fit)

fit <- glm(Status~White_Inc_Rate+Per_Black+Police_Expend+`Weed_Prohibition_Bil$`+Possession_Expend,,data=df,family=quasibinomial()) 
summary(fit)
