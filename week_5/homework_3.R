  setwd("/Users/ankitchaudhary/Documents/sem1_fall18/cs634_DataMining/week_5/")


library(data.table)
library(dplyr)
library("curl")
library("MASS")
library("zoo")
library("discretization")

#options(warn = -1)

#dataSet<- fread("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")


alpha<-c(0.10,0.05,0.025,0.02,0.01)
column<- c(1,3)


colLen<- length(column)
lenAlpha<- length(alpha)

funn<- function(i,data,alpha){ 
  p1 <- length(data[1,])
  p <- p1-1
  y <- as.integer(data[,p1])
  class <- dim(table(data[, p1]))
  discredata <- data
  threshold <- qchisq(1 - alpha, class - 1)
  cuts <- numeric()
  z <- sort(unique(data[, i]))
  
  
  if(length(z)<=1) 
    return(list(cuts=""))
  dff <- diff(z)/2
  lenz <- length(z)
  cutpoint <- z[1:(lenz-1)]+dff
  midpoint <- c(z[1],cutpoint,z[lenz])
  
  a <- cut(data[, i], breaks = midpoint, include.lowest = TRUE)
  b <- table(a, data[, p1])
  b <- as.array(b)
  
  
  repeat{
    m <- dim(b)[1]
    if(length(dim(b))<2||m<2) break
    test <- numeric()
    for (k in 1:(m - 1)) {
      d <- b[c(k,k+1), ]
      test[k] = chiSq(d)
    }  
    
    #chisq value
    k <- which.min(test)
    if(test[k]>threshold) break
    b[k+1,] <- b[k,]+b[k+1,]
    cutpoint <- cutpoint[-k]
    midpoint <- midpoint[-(k+1)]
    b <- b[-k,]
  }
  cuts <- cutpoint 
 
  return(list(cuts=cuts)) 
}

# 1st for loop to access columns as Sepal Length and petal Length
for (p in 1:colLen){
  # access alpha values
  for (h in 1:lenAlpha) {
    print(funn(column[p],iris, alpha[h]))
  }
}



