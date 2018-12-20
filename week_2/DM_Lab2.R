
stock<- read.csv("/Users/ankitchaudhary/Documents/IS_Sem1/Data_Mining/Attachments_2nd Week/data_akbilgic.csv", header = T, sep = ",")

str(stock)
summary(stock)
dim(stock)

#1. Find the mean, median, mode, standard deviation and variance of each of the 8 stocks

#meanISE<- mean(stock$ISE)
#medianISE<- median(stock$ISE, na.rm = F)
#sdISE<- sd(stock$ISE, na.rm = F)
#varianceISE<- var(stock$ISE)

sapply(stock, mean, na.rm=T)
sapply(stock, median, na.rm=T)
sapply(stock, sd, na.rm=T)
sapply(stock, var, na.rm=T)

mode<- function(num) {
  unique.num<- unique(num)
  unique.num[which.max(tabulate(match(num,unique.num)))]
}

mode(stock$ISE)
mode(stock$SP)
mode(stock$DAX)
mode(stock$FTSE)
mode(stock$NIKKEI)
mode(stock$BOVESPA)
mode(stock$EU)
mode(stock$EM)


#2. Draw box plot of each stock and identify outliers.
box_plot<- boxplot(stock[1:8], horizontal = F, main ="Box-plot of each stock",col="lightgray")
box_plot
box_plot$out
#box_plot$stats


#3. Draw a Q-Q plot of  Istanbul stock exchange national 100 index and MSCI emerging markets index 
qq_plot<- qqplot(stock$ISE, stock$EM, xlab = "Istanbul Exchnage", ylab = "Emerging market", plot.it = T, main="ISE 100 & Emerging markets index")


#4. Are these two correlated? If so, how?
#   Yes, they are correlated. Emerging market stocks increases with Istanbul Exchange as it follows linear graph [x increase with y].
cor(x = stock$ISE, y= stock$EM)
corr<- cor(stock)
corr
ggcorrplot(corr)
ggcorrplot(corr,  hc.order = T,type = "lower", lab = T, method = "circle")

#plot(x= stock$ISE, y=stock$EM)


#5. Between Stock market return index of Japan, Stock market return index of Brazil, do you observe any correlation?
qq_plot1<- qqplot(stock$NIKKEI, stock$BOVESPA, xlab = "Japan Stock", ylab = "Brazil Stock", plot.it = T, main="Japan Stock & Brazil Stock index")
#   Yes, they are correlated. Brazil stocks goes up with Japan stocks as it follows linear graph [x increase with y].
cor(x = stock$NIKKEI, y = stock$BOVESPA)

