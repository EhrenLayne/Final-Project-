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
library(coefplot)
data(iris)

df <- read.xlsx("weed_data.xlsx")
df <- subset (df, select = -Illegal)
df <- subset (df, select = -Medicinal)
df <- subset (df, select = -Sales_Expend)
df <- subset (df, select = -Sales_Arrests)
df <- subset (df, select = -Judicial_Expend)
df <- subset (df, select = -Corrections_Expend)
dfmat <- as.matrix(df)


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


inv.logit <- function(mu)  log(mu/(1-mu))
logit <- function(Xb)  1/(1+exp(-Xb))
ana.logit <- glm(Per_Black ~ Black_Inc_Rate, data=df, family=binomial(link=logit))
par(mfrow=c(1,1),mar=c(5,5,2,2),lwd=2,col.axis="white",col.lab="white",
    col.sub="white",col="white",bg="slategray",
    cex.lab=1.3,oma=c(4,2,2,2))
xbeta <- as.matrix(cbind(rep(1,length=nrow(df)),df$Per_Black)) %*% 
  coef(ana.logit)
plot(range(xbeta),c(-0.1,1.1),type="n",xlab="Black percentage of population by state",
     ylab="Black Incarceration Rate")
abline(h=c(0,1),col="yellow")
x <- seq(from=min(xbeta),to=max(xbeta),length=100)
points(xbeta,df$Black_Inc_Rate,col="black",pch=19)
lines(xbeta,logit(xbeta),col="black")


inv.logit <- function(mu)  log(mu/(1-mu))
logit <- function(Xb)  1/(1+exp(-Xb))
ana.logit <- glm(Per_Black ~ White_Inc_Rate, data=df, family=binomial(link=logit))
par(mfrow=c(1,1),mar=c(5,5,2,2),lwd=2,col.axis="white",col.lab="white",
    col.sub="white",col="white",bg="slategray",
    cex.lab=1.3,oma=c(4,2,2,2))
xbeta <- as.matrix(cbind(rep(1,length=nrow(df)),df$Per_Black)) %*% 
  coef(ana.logit)
plot(range(xbeta),c(-0.1,1.1),type="n",xlab="Black percentage of population by state",
     ylab="White incarceration rate")
abline(h=c(0,1),col="yellow")
x <- seq(from=min(xbeta),to=max(xbeta),length=100)
points(xbeta,df$Black_Inc_Rate,col="black",pch=19)
lines(xbeta,logit(xbeta),col="black")


# Scatterplot:
par(mfrow=c(1,1),mar=c(5,5,2,2),lwd=2,col.axis="white",col.lab="white",
    col.sub="white", col="white",bg="slategray", cex.lab=1.3)
plot(df$Age[df$Per_Black==0],df$Police_Expend[df$Per_Black==0],
     pch=19,col="yellow",
     xlim=range(df$Black_Inc_Rate),ylim=range(df$Police_Expend),
     xlab="Black population percentage",ylab="Police_Expend(g/dl)")
points(df$Black_Inc_Rate[df$Per_Black==1],df$Police_Expend[df$Per_Black==1],
       pch=19,col="red")