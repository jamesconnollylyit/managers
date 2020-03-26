# Load the csv file first. Place it inside the working dir
getwd()
my_data <- read.csv("Diabetes-md.csv")

# 2 
class(my_data)
str(my_data)

# 3
my_data[!complete.cases(my_data),]

# Appears that some fields have missing data that needs to be recoded
my_data$Address[my_data$Address == ""] <- NA
my_data$Daibetes.type[my_data$Daibetes.type == ""] <- NA
my_data$Status[my_data$Status == ""] <- NA

my_data[!complete.cases(my_data),]

# this shows that it still contains ""
# so update we need to convert to char
# first and then recode to factor
str(my_data)
my_data$Daibetes.type <- as.character(my_data$Daibetes.type)
str(my_data)

# Then convert back to a factor
my_data$Daibetes.type <- as.factor(my_data$Daibetes.type)
str(my_data)

# convert address to character
# convert status to char -> factor
my_data$Address <- as.character(my_data$Address)

# repeat for status
my_data$Status <- as.character(my_data$Status)
my_data$Status <- as.factor(my_data$Status)
str(my_data)

# deal with missing data. What do we decide to do?
# chart missing data first. Refer to GitHub notes

# Analysing missing data

# Refresh understanding of NA's in the data
my_na <- my_data[!complete.cases(my_data),]
nrow(my_na)

# Install packages for the graphics option
# install.packages("mice")
library(mice)
md.pattern(my_data)

# Use VIM package to show the missing values
#install.packages("VIM")
library(VIM)

missing_values <- aggr(my_data, prop = TRUE, numbers = TRUE)
summary(missing_values)

# I've decided that missing NI addresses are not important
# and I'll keep them
# ONly data with missing "type" and "Health status" 
# are important in this study and so incomplete cases will be deleted.
my_na <- my_data[!complete.cases(my_data$Daibetes.type, my_data$Status),]
my_na
nrow(my_na)
nrow(my_data)

# 15 rows have missing information
# Reverse the logic to contain relevant data
full_data <- my_data[complete.cases(my_data$Daibetes.type, my_data$Status),]
nrow(full_data)

# 4 - configure type to an unordered factor
# refactor status
my_data$Status <- factor(my_data$Status, order = TRUE, levels = c("Poor", "Improved", "Excellent"))
str(my_data)

#5 
col_names = c("Patient name", "NI address", "Type", "Age", "Health status")
colnames(my_data) <- col_names
head(my_data, 10)

# 6
patient_names <- my_data[1:1]
head(patient_names, 10)

