# Import dependencies
library(dplyr)

# Read in MechaCar_mpg.csv
mechaCar <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression test
model <- lm(mpg~vehicle_length+vehicle_weight+spoiler_angle+ground_clearance+AWD,data=mechaCar)

# Use summary function to retrieve p-value and r-squared value
summary(model)

