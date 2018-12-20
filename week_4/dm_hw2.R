setwd("/Users/ankitchaudhary/Documents/IS_Sem1/Data_Mining/week_4/")


cars<- read.table("car.csv", sep=',', header = T)
head(cars)
class(cars)
str(cars)
names(cars)

cars$buying<- as.numeric(cars$buying)
cars$maint<- as.numeric(cars$maint)
cars$doors<- as.numeric(cars$doors)
cars$persons<- as.numeric(cars$persons)
cars$lug_boot<- as.numeric(cars$lug_boot)
cars$safety<- as.numeric(cars$safety)
cars$class<- as.numeric(cars$class)


#rnorm(cars$buying)


daisy(cars)
df<-data.frame(as.matrix(daisy(cars,metric = 'gower')))
view(df)
max(df)
unique(df)
a<- as.matrix(daisy(cars,metric = 'gower'))
class(a)

length(unique(cars$buying))
sort(a) %>% 

apply(a, 1, FUN = function(x) {min(x[x > 0])})

