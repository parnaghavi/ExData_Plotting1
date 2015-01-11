# set working directory (change this to fit your needs) 
3 setwd('~/Source Code/GitHub/Exploratory-Data-Analysis') 
4  
5 # make sure the plots folder exists 
6 if (!file.exists('plots')) { 
7   dir.create('plots') 
8 } 
9  
10 # load data 
11 source('scripts/get_and_clean_data.R') 
12  
13 # open device 
14 png(filename='plots/plot4.png',width=480,height=480,units='px') 
15  
16 # make 4 plots 
17 par(mfrow=c(2,2)) 
18  
19 # plot data on top left (1,1) 
20 plot(power.consumption$DateTime,power.consumption$GlobalActivePower,ylab='Global Active Power',xlab='',type='l') 
21  
22 # plot data on top right (1,2) 
23 plot(power.consumption$DateTime,power.consumption$Voltage,xlab='datetime',ylab='Voltage',type='l') 
24  
25 # plot data on bottom left (2,1) 
26 lncol<-c('black','red','blue') 
27 lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3') 
28 plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering') 
29 lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2]) 
30 lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3]) 
31  
32 # plot data on bottom right (2,2) 
33 plot(power.consumption$DateTime,power.consumption$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l') 
34  
35 # close device 
36 x<-dev.off() 
