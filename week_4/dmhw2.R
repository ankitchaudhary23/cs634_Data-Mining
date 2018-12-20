setwd("/Users/ankitchaudhary/Documents/IS_Sem1/Data_Mining/week_4/")

library(data.table)
library (cluster)



car<- fread('http://archive.ics.uci.edu/ml/machine-learning-databases/car/car.data')
class(car)
str(car)
car$V1[car$V1 == "vhigh"] <- 1
car$V1[car$V1 == "high"] <- 2
car$V1[car$V1 == "med"] <- 3
car$V1[car$V1 == "low"] <- 4
str(car$V1)
car$V1 <- as.numeric(car$V1)


car$V2[car$V2 == "vhigh"] <- 1
car$V2[car$V2 == "high"] <- 2
car$V2[car$V2 == "med"] <- 3
car$V2[car$V2 == "low"] <- 4
str(car$V2)
car$V2 <- as.numeric(car$V2)

car$V3[car$V3 == "2"] <- 1
car$V3[car$V3 == "3"] <- 2
car$V3[car$V3 == "4"] <- 3
car$V3[car$V3 == "5more"] <- 4
str(car$V3)
car$V3 <- as.numeric(car$V3)


car$V4[car$V4 == "2"] <- 1
car$V4[car$V4 == "4"] <- 2
car$V4[car$V4 == "more"] <- 3
str(car$V4)
car$V4 <- as.numeric(car$V4)


car$V5[car$V5 == "small"] <- 1
car$V5[car$V5 == "med"] <- 2
car$V5[car$V5 == "big"] <- 3
str(car$V5)
car$V5 <- as.numeric(car$V5)

car$V6[car$V6 == "low"] <- 1
car$V6[car$V6 == "med"] <- 2
car$V6[car$V6 == "high"] <- 3
str(car$V6)
car$V6 <- as.numeric(car$V6)


car$V7[car$V7 == "unacc"] <- 1
car$V7[car$V7 == "acc"] <- 2
car$V7[car$V7 == "good"] <- 3
car$V7[car$V7 == "vgood"] <- 4
str(car$V7)
car$V7 <- as.numeric(car$V7)

str(car)

#if(car$V1[car$V1 == 1] | car$V2[car$V2 == 1] | car$V3[car$V3 == 1] | car$V7[car$V7 == 1] ){
#  car$V1[car$V1 == 1] <- (1-1)/(4-1)
#  car$V2[car$V2 == 1] <- (1-1)/(4-1)
#  car$V3[car$V3 == 1] <- (1-1)/(4-1)
#  car$V7[car$V7 == 1] <- (1-1)/(4-1)
#}


#scaling
var1<- (1-1)/(4-1)
var2<- (2-1)/(4-1)
var3<- (3-1)/(4-1)
var4<- (4-1)/(4-1)
var5<- (1-1)/(3-1)
var6<- (2-1)/(3-1)
var7<- (3-1)/(3-1)


car$V1[car$V1 == 1] <- var1
car$V1[car$V1 == 2] <- var2
car$V1[car$V1 == 3] <- var3
car$V1[car$V1 == 4] <- var4



car$V2[car$V2 == 1] <- var1
car$V2[car$V2 == 2] <- var2
car$V2[car$V2 == 3] <- var3
car$V2[car$V2 == 4] <- var4


car$V3[car$V3 == 1] <- var1
car$V3[car$V3 == 2] <- var2
car$V3[car$V3 == 3] <- var3
car$V3[car$V3 == 4] <- var4


car$V4[car$V4 == 1] <- var5
car$V4[car$V4 == 2] <- var6
car$V4[car$V4 == 3] <- var7


car$V5[car$V5 == 1] <- var5
car$V5[car$V5 == 2] <- var6
car$V5[car$V5 == 3] <- var7


car$V6[car$V6 == 1] <- var5
car$V6[car$V6 == 2] <- var6
car$V6[car$V6 == 3] <- var7


car$V7[car$V7 == 1] <- var1
car$V7[car$V7 == 2] <- var2
car$V7[car$V7 == 3] <- var3
car$V7[car$V7 == 4] <- var4



#dissimilarity matrix

car_dist <- as.matrix (dist(car))
car_dist

#Question 1

x<-unique(sort(car_dist))
x
x[1]
str(x)
length(x)
class(x)
glimpse(x)

num1 <- which(car_dist == x[2], arr.ind = TRUE)
class(num1)
str(num1)
num1

#remove opposite pairs

for (i in 1:nrow(num1))
{
  num1[i, ] = sort(num1[i, ])
}
num1 = num1[!duplicated(num1),]
num1


#Question 2 
#
num2 <- which(dtCarsDist == max(car_dist), arr.ind = TRUE)
num2
#remove opposite pairs
for (i in 1:nrow(num2))
{
  num2[i, ] = sort(num2)
}
num2 = num2[!duplicated(num2),]
num2



#Question 3
#
car_cor <- cor(car)
num3 <- unique(sort(car_cor))

#highest +ve correlation
num4 <- which(car_cor == num3[2], arr.ind = TRUE)

#remove opposite pairs
for (i in 1:nrow(num4))
{
  num4[i, ] = sort(num4[i, ])
}
num4 = num4[!duplicated(num4),]
num4
plot(car$V6, car$V7, xlab = "Safety", ylab = "Class", main = "Safety vs Class")


#Question 4

good_carsc <- subset(cars, car$V7 == 1) 
good_carsc

#dissimilarity matrix of good cars

good_car_dist <- as.matrix (dist(good_carsc))
good_car_dist


