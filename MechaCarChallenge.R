library(dplyr)
mpg <- read.csv(file='MechaCar_mpg.csv')

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg) #generate multiple linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mpg)) #generate summary statistics

library(tidyverse)
lots <- read.csv(file='Suspension_Coil.csv')
total_summary <- lots %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) #create dataframe with summary statistics on PSI
lot_summary <- lots %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI)) #create dataframe with summary statistics on PSI by lot

t.test(lots$PSI, mu=1500) # compare mean PSI across all lots to population mean of 1500

t.test(subset(lots,Manufacturing_Lot == 'Lot1',select=PSI), mu=1500) # compare mean PSI of Lot1 to population mean of 1500
t.test(subset(lots,Manufacturing_Lot == 'Lot2',select=PSI), mu=1500) # compare mean PSI of Lot2 to population mean of 1500
t.test(subset(lots,Manufacturing_Lot == 'Lot3',select=PSI), mu=1500) # compare mean PSI of Lot3 to population mean of 1500
