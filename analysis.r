#https://www.kaggle.com/datasets/nancyalaswad90/diamonds-prices
diamonds <- read.csv("Diamonds Prices2022.csv")
library('tidyverse')
#Check out diamonds data set
head(diamonds)
glimpse(diamonds)
diamonds %>% filter_all(any_vars(is.na(.)))

#Q1.How carat & cut affect the price
cor(diamonds$carat,diamonds$price) 
diamonds %>% ggplot(aes(carat,price))+geom_point(aes(color=cut))+labs(title="Carat&Cut vs Price")+theme_bw()
diamonds %>% group_by(cut)%>% summarise(qty=length(x),avg_carat=mean(carat),avg_price=mean(price)) %>% arrange(desc(avg_price))

#Finding 1. the larger the carat, the higher the price. no matter which cut.
#Finding 2. most diamonds are below 2.5 carat.
#Finding 3. Fair cut diamonds are priced lower.but more > 2.5 carat diamonds with fair cut. hence, their avg prices are 2nd expensive.

#Q2.How carat and clarity affects the price
diamonds %>% ggplot(aes(carat,price))+geom_point(aes(color=clarity))+labs(title="Carat&Clarity vs Price")+theme_bw()
diamonds %>% group_by(clarity)%>% summarise(qty=length(x),avg_carat=mean(carat),avg_price=mean(price)) %>% arrange(desc(avg_price))

#Finding 1. The higher the clarity, the higher the price.
#Finding 2. Low clarity diamonds are priced lower.but more > 2.5 carat diamonds with low clarity. hence, overall their price are higher. 

#Q3.How carats and color affects the price
diamonds %>% ggplot(aes(carat,price))+geom_point(aes(color=color))+labs(title="Carat&Color vs Price")+theme_bw()
diamonds %>% group_by(color)%>% summarise(qty=length(x),avg_carat=mean(carat),avg_price=mean(price)) %>% arrange(desc(avg_price))

#Finding 1.The colorless the color,the higher the price.
#Finding 2. Low level color diamonds are priceed lower. but more  > 2.5 carat diamonds with low level color. hence, overall their price are higher.

