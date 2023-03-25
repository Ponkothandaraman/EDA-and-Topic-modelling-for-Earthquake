library(readr)
library(MASS)
library(dplyr)
library(lattice)
library(ggplot2)
dt <- read_csv("earthquake_data.csv")
View(dt)

summary(dt)
str(dt)

#Removing two columns
dt = subset(dt, select = -c(latitude,longitude,title,date_time))
dt = subset(dt, select = -c(country,continent))
dt

#Checking null values
colSums(is.na(dt))

#Changing the specific variables to categorical
dt$alert=as.factor(dt$alert)
dt$tsunami=as.factor(dt$tsunami)
dt$magType=as.factor(dt$magType)
dt$net=as.factor(dt$net)
str(dt)

#histogram
histogram(~magnitude|tsunami,data=dt,col=c("black","blue"),main="histogram of magnitude according to tsunami")
histogram(~depth|alert,data=dt,col=c("black","blue"),main="depth of the alert")
histogram(~cdi|magType,data=dt,col=c("black","blue"),main="intensity of the magtype")
histogram(~mmi|alert,data=dt,col=c("black","blue"),main="estimated intensity of the alert")
histogram(~cdi|alert,data=dt,col=c("black","blue"),main="reported intensity of the alert")

#boxplot
boxplot(magnitude~alert,data=dt,col=c("yellow","red"))
boxplot(magnitude~tsunami,data=dt,col=c("yellow","red"))
boxplot(sig~alert,data=dt,col=c("yellow","red"))
boxplot(cdi~alert,data=dt,col=c("yellow","red"))

#scatterplot
ggplot(dt, aes(x=magnitude, y=sig)) + geom_point()
ggplot(dt, aes(x=dmin, y=sig)) + geom_point()
ggplot(dt, aes(x=sig, y=depth)) + geom_point()
ggplot(dt, aes(x=sig, y=depth)) + geom_point()
ggplot(dt, aes(x=cdi, y=nst)) + geom_point()
ggplot(dt, aes(x=dmin, y=depth)) + geom_point()


