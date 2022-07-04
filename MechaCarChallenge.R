# Import dependencies
library(dplyr)

# Read in MechaCar_mpg.csv & Suspension_Coil.csv
mechaCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
susCoil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors=F)

# Perform linear regression test
model <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mechaCar)

# Use summary function to retrieve p-value and r-squared value
summary(model)

# Create total summary DF
total_summary <- susCoil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep')

# Create lot summary using group_by and summarize
lot_summary <- susCoil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups='keep')

# Comparing all lots against mean PSI of the population w/ t-test
t.test(susCoil$PSI,mu=mean(susCoil$PSI))

# Comparing Lot 1 against mean population PSI
Lot1_Data <- susCoil %>% filter(Manufacturing_Lot=="Lot1")
t.test(Lot1_Data$PSI,mu=mean(susCoil$PSI))

# Comparing Lot 2 against mean population PSI
Lot2_Data <- susCoil %>% filter(Manufacturing_Lot=="Lot2")
t.test(Lot2_Data$PSI,mu=mean(susCoil$PSI))

# Comparing Lot 3 against mean population PSI
Lot3_Data <- susCoil %>% filter(Manufacturing_Lot=="Lot3")
t.test(Lot3_Data$PSI,mu=mean(susCoil$PSI))
