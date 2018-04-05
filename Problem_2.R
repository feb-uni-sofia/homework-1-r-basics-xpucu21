## NOTE: readability: leave some blank linkes between the code to make it more readable

#Problem 2
#a)
xmin<-c(23,20.5,28.2,20.3,22.4,17.2,18.2)
xmax<-c(25,22.8,31.2,27.3,28.4,20.2,24.1)
#b)
difff<-xmax-xmin 
#c)
avgMin<-mean(xmin)
avgMax<-mean(xmax)
#d)
xmin[xmin<avgMin]
#e)
xmin[xmax>avgMax]

#f)
## NOTE: not DRY (don't repeat yourself). Assign the dates to a vector and
## then use that vector to assign names to the elements of xmin and xmax

names(xmin)<-c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
names(xmax)<-c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')

#g)
temperature<-data.frame(xmin,xmax)
#h)
temperature <- within(temperature, {
	Fahrenheit<-9/5*xmin+32
})
#i)
Fahrenheitnew<-data.frame(fxmin=9/5*xmin+32,fxmax=9/5*xmax+32)
#j)
Fahfivedays<-data.frame(fxmin=xmin[seq(1:5)]*9/5+32,fxmax=xmax[seq(1:5)]*9/5+32)

## This is not exclusion
Fahfivedayss<-data.frame(fxmin=xmin[seq(length(xmin)-2)]*9/5+32,fxmax=xmax[seq(length(xmax)-2)]*9/5+32) 


## Easier way to do the above

temperatures <- within(temperatures, {
  xminFahrenheit <- xmin * (9/5) + 32
  xmaxFahrenheit <- xmax * (9/5) + 32
})

temperaturesFahrenheit <- temeratures[, c('xminFahrenheit', 'xmaxFahrenheit)]

## Easier to subset the whole data.frame instead of 
## doing this for each vector used in its construction

temperaturesFahrenheit[1:5, ]
temperaturesFahrenheit[-(6:7), ]

