# set working directory (change this to fit your needs) 
2 setwd('~/Source Code/GitHub/Exploratory-Data-Analysis') 
3  
4 # make sure the plots folder exists 
5 if (!file.exists('plots')) { 
6   dir.create('plots') 
7 } 
8  
9 # load data 
10 source('scripts/get_and_clean_data.R') 
11  
12 # open device 
13 png(filename='plots/plot1.png',width=480,height=480,units='px') 
14  
15 # plot data 
16 hist(power.consumption$GlobalActivePower,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red') 
17  
18 # Turn off device 
19 x<-dev.off() 
