setwd("/Users/ankitchaudhary/Documents/sem1_fall18/cs634_DataMining/week_6/")

library(tidyverse)
library(arules)
library(arulesViz)
library(splitstackshape)

# read data
forest <- read.csv("forests.txt", header = F)
class(forest)

#forestTran<- as(forest,"transactions")
#transaction_forest <- read.transactions(file = "forestTransactions.csv",sep = ",",rm.duplicates = T, format = "single", sep = ",", cols=c(1,2))

### Ques1. Find out the pattern of all plant species (i.e., ids) in the forests with support  threshold = 50%

forest$V2<-c(seq(1:246))
splitForest<-cSplit(forest,"V1"," ","long")

write.table(splitForest, file="forests.csv", sep=",", col.names = FALSE, row.names = FALSE)

forest_transactions<-read.transactions(file = "forests.csv", rm.duplicates = FALSE, format = "single", sep = ",", cols=c(1,2))

#groceryrules <- apriori(forestTran, parameter = list(support = 0.006, confidence = 0.1, minlen = 2))
frequent_items <- apriori(forest_transactions,parameter = list(support = 0.5,target = "frequent items"))
inspect(head(frequent_items))

summary(rules)
plot(rules, jitter = 0)
itemFrequency(forest_transactions[,])
itemFrequencyPlot(forest_transactions,topN=10,type="absolute")



### Ques2. Find out the max-frequent-plant species with the same support threshold.(2)


maximal_itemsets <- apriori(forest_transactions,parameter = list(support = 0.5,target = "maximally frequent itemsets"))
maximal <-is.maximal(maximal_itemsets)
inspect(maximal_itemsets[maximal])
inspect(head(maximal_itemsets))


### Ques3. With a confidence threshold of 70% (and support threshold 40%), find out all strong association rules.

rules <- apriori(forest_transactions,parameter = list(sup = 0.4, conf = 0.7,target="rules"))
inspect(head(rules))



