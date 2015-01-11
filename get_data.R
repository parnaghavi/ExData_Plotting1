1  
2 # set working directory (change this to fit your needs) 
3 setwd('~/Source Code/GitHub/Exploratory-Data-Analysis') 
4  
5 # required packages 
6 library(data.table) 
7 library(lubridate) 
8  
9 # make sure the sources data folder exists 
10 if (!file.exists('source data')) { 
11   dir.create('source data') 
12 } 
13  
14 # check to see if the existing tidy data set exists; if not, make it... 
15 if (!file.exists('source data/power_consumption.txt')) { 
16    
17   # download the zip file and unzip 
18   file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip' 
19   download.file(file.url,destfile='source data/power_consumption.zip') 
20   unzip('source data/power_consumption.zip',exdir='source data',overwrite=TRUE) 
21  
22   # read the raw table and limit to 2 days 
23   variable.class<-c(rep('character',2),rep('numeric',7)) 
24   power.consumption<-read.table('source data/household_power_consumption.txt',header=TRUE, 
25                                 sep=';',na.strings='?',colClasses=variable.class) 
26   power.consumption<-power.consumption[power.consumption$Date=='1/2/2007' | power.consumption$Date=='2/2/2007',] 
27  
28   # clean up the variable names and convert date/time fields 
29   cols<-c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity', 
30           'SubMetering1','SubMetering2','SubMetering3') 
31   colnames(power.consumption)<-cols 
32   power.consumption$DateTime<-dmy(power.consumption$Date)+hms(power.consumption$Time) 
33   power.consumption<-power.consumption[,c(10,3:9)] 
34    
35   # write a clean data set to the directory 
36   write.table(power.consumption,file='source data/power_consumption.txt',sep='|',row.names=FALSE) 
37 } else { 
38    
39   power.consumption<-read.table('source data/power_consumption.txt',header=TRUE,sep='|') 
40   power.consumption$DateTime<-as.POSIXlt(power.consumption$DateTime) 
41  
42 } 
43  
44 # remove the large raw data set  
45 if (file.exists('source data/household_power_consumption.txt')) { 
46   x<-file.remove('source data/household_power_consumption.txt') 
47 } 
