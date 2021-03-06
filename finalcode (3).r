library('ggplot2')
library('forecast')
library('tseries')
library('tidyverse')
library('TTR')
data<-read.csv("F:/PROJECT/dat1.csv")
print(data)
data1<-ts(data)
#print(data1)
plot.default(data$total_productivity, type="o", xlab="Time(Years)", ylab="Total Productivity(MT/Hectare)", main="Data Plot")
p1<-ggplot(data,aes(x="Time", y="Yield(MT/Hectare)"))
p1
p2<-ggplot(data,aes(x=data$year,y=data$total))
p2
plot(data$year,data$total,xlab='Year',ylab='Yield',main='Overall Horticulture Yield', type="s")
adf=adf.test(data$total_productivity)
print(adf)
acf(data$total_productivity)
differenced_yield=diff(data$total_productivity)
plot(differenced_yield,type="o", main="Stationarized Data Plot", xlab="Time(Years)")
acf(differenced_yield)
adf1=adf.test(differenced_yield)
print(adf1)
pacf(differenced_yield)
model<-arima(data$total_productivity,order = c(4,1,2),method = "ML")
print(model)
print(BIC(model))
fore<-forecast(model,h=5)
print(fore)
plot(fore, xlab="Time(Years)",ylab="Yield(MT/Hectare)", main="Forecast Plot", legend="Forecasted yield")
model3<-arima(data$total,order = c(4,1,3))
print(model3)
print(BIC(model3))
fore3<-forecast(model3,h=3)
print(fore3)
plot(fore3)
model1<-arima(data$total,order = c(5,1,2))
print(model1)
print(BIC(model1))
fore1<-forecast(model1,h=3)
print(fore1)
plot(fore1)
model2<-arima(data$total,order = c(5,1,3))
print(model2)
print(BIC(model2))
fore2<-forecast(model2,h=3)
print(fore2)
plot(fore2)
model4<-arima(data$total,order = c(4,1,1))
print(model4)
print(BIC(model4))
fore4<-forecast(model4,h=3)
print(fore4)
plot(fore4)
print(model$residuals)
print(Box.test(model$residuals,type = "Ljung-Box"))
print(Box.test(model1$residuals,type = "Ljung-Box"))
print(Box.test(model2$residuals,type = "Ljung-Box"))
print(Box.test(model3$residuals,type = "Ljung-Box"))
print(Box.test(model4$residuals,type = "Ljung-Box"))
auto<-auto.arima(data$total,allowdrift=FALSE)
print(auto)
fore<-forecast(auto,h=3)
print(fore)
plot(fore)
accuracy(model)
accuracy(model3)
accuracy(model1)
accuracy(model2)
accuracy(model4)
accuracy(auto)
decomdata<-decompose(data$total)
plot(decomdata)
datas<-stl(data1)
datas



reg=lm(data)
