#################################################
#Here are the data for the project:

#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#You should create one R script called run_analysis.R that does the following.

# 1. Merges the training and the test sets to create one data set.
# 2, Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#set working directory
setwd("~/DataScienceCoursera")

#load libraries used in analysis
library(dplyr)
library(plyr)
library(data.table)

#download data files to working directory
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <- "HAR.zip"
download.file(fileurl,destfile = filename)  

#unzip files
unzip("HAR.zip", exdir = "HARData")

#read in lookup files
features <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/features.txt", 
                       col.names = c("featurecode", "feature"))
activity_labels <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/activity_labels.txt", 
                       col.names = c("activitycode", "activity"))

#read in training datasets
subject_train <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/train/subject_train.txt", 
                            col.names = c("subjectid"))
y_train <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/train/y_train.txt",
                      col.names = c("activitycode")) 
X_train <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/train/X_train.txt",
                      col.names = features$feature)

#combine training files
train <- cbind(subject_train, y_train, X_train)

#read in test datasets
subject_test <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/test/subject_test.txt", 
                           col.names = c("subjectid"))
y_test <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/test/y_test.txt", 
                     col.names = c("activitycode"))
X_test <- read.table("~/DataScienceCoursera/HARData/UCI HAR Dataset/test/X_test.txt",
                     col.names = features$feature)

#combine test files
test <- cbind(subject_test, y_test, X_test)

#merge (combine) test and training datasets
combined <- rbind(train, test)

#attach activitiy name to activitiy code
combined <- merge(combined, activity_labels, all=TRUE)

#subset dataset to include only mean and std measurements
subset <- select(combined, subjectid, activity, ends_with("std.."), ends_with("mean.."))

#rename variables (lower case, remove .)
names(subset) <- tolower(names(subset))
names(subset) <- gsub("\\.", "", names(subset))

#sort dataset
subset <-arrange(subset, subjectid)

#calculate means for each subject by activity
mydt <- data.table(subset)
variables <- tail( names(mydt), -2)
subsetmean <- mydt[, lapply(.SD, mean), .SDcols=variables, by=list(subjectid, activity)]

#create and export final dataset
write.csv(subsetmean, "run_analysis_tidy_dataset.csv")

