#Import Libraries 
library(tidyverse)
library(tidyr)

#Import file
df <- read.csv(file = "C:/Users/willi/OneDrive/Desktop/Data/Coding_Temple_Week_7/train.csv")
df

#Drop null values
df <- drop_na(df)

#Delete all duplicates 
df <- distinct(df)

df

#Change column names to standard format
replace_col <- function(x){
  names(x) <- names(x) %>% str_replace_all("\\.", "_")
  return(x)
}
df <-  replace_col(df)
print(df)

#Save cleaned data set to new file name
write.csv(df, file = "C:/Users/willi/OneDrive/Desktop/Data/Coding_Temple_Week_7/clean_train.csv")


install.packages("plotly")

library(ggplot2)
library(plotly)

#Create a bar plot of passenger count by home planet
ggplot(data, aes(x = HomePlanet)) +
  geom_bar() +
  xlab("Home Planet") +
  ylab("Count") +
  ggtitle("Passenger Count by Home Planet")

#Create a histogram of passenger age
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 5) +
  xlab("Age") +
  ylab("Frequency") +
  ggtitle("Distribution of Passenger Age")

#Create a scatter plot of age vs. VIP status
ggplot(data, aes(x = Age, y = VIP)) +
  geom_point() +
  xlab("Age") +
  ylab("VIP") +
  ggtitle("Age vs. VIP Status")

