 
2 # set working directory (change this to fit your needs) 
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
14 png(filename='plots/plot3.png',width=480,height=480,units='px') 
15  
16 # plot data 
17 lncol<-c('black','red','blue') 
18 lbls<-c('Sub_metering_1','Sub_metering_2','Sub_metering_3') 
19 plot(power.consumption$DateTime,power.consumption$SubMetering1,type='l',col=lncol[1],xlab='',ylab='Energy sub metering') 
20 lines(power.consumption$DateTime,power.consumption$SubMetering2,col=lncol[2]) 
21 lines(power.consumption$DateTime,power.consumption$SubMetering3,col=lncol[3]) 
22  
23 # add legend 
24 legend('topright',legend=lbls,col=lncol,lty='solid') 
25  
26 # close device 
27 x<-dev.off() 
