#Karoliina Isoaho, Nov 9th 2017
#This is my R code for the data wrangling exercise.

# Read the full learning data
lrn14 <- read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)

# Exploring its structure and dimensions
str(lrn14)
dim(lrn14)
# data has 183 rows and 60 columns
# str shows the variables and observations in the data.frame

# Creating an analysis dataset with the variables gender, age, attitude, deep, stra, surf and points
# Questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(lrn14, one_of(deep_questions))
lrn14$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(lrn14, one_of(surface_questions))
lrn14$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(lrn14, one_of(strategic_questions))
lrn14$stra <- rowMeans(strategic_columns)

# choose a handful of columns to keep
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(lrn14, one_of(keep_columns))

# select rows where points is greater than zero
learning2014 <- filter(learning2014, points > 0)

# Printing dimensions of learning2014 to check that there are 166 observations with 7 variables
dim(learning2014)

# Setting working directory of this R session to the IODS project folder
setwd("/Users/testitesti/Documents/GitHub/IODS-project/data/")
getwd()

# Saving the analysis dataset 'learning2014' that I created to the data folder with CSV
?write.csv
write.csv(learning2014, file = "learning2014.csv")

# demonstrating reading capabilities
read.csv(file = "learning2014.csv")
head(learning2014)
str(learning2014)





