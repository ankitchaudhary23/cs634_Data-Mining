mydata<- read.table("/Users/ankitchaudhary/Documents/IS_Sem1/Data Analytics with R/Attachments_1st Week/Games.csv",
                    header = T, sep = ",")

library(ggplot2)
summary(mydata)
dim(mydata)
head(mydata)
str(mydata)

nrow(mydata)
ncol(mydata)

mydata[1:2,]
mydata[1:2, 1:3]
mydata[1:1230,1:3]
mean(mydata$X1st.score)


sapply(mydata$X1st.score, range, na.rm=T)
sapply(mydata$X1st.score, quantile, na.rm=T)
sapply(mydata[1:3, 1:3]$X1st.score, mean, na.rm=T)
sapply(mydata$X1st.score, mean, na.rm=T)

mydata[mydata$X1st.score<10,]
plot(mydata$X1st.score, mydata$X2nd.score)

abline(lm(mydata$X1st.score~mydata$X2nd.score))
title("Regression of 1st quarter score on 2nd quarter score")

boxplot(mydata[2,5], main='the box plot of scores')

cor(mydata[,2],mydata[,3])

save(mydata, file = "mydata.RData")
load("myData.RData")
cat("Hello world")
