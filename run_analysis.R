## As specfied in the Course Project Instructions
## "The code should have a file run_analysis.R in the
## main directory that can be run as long as the
## Samsung data is in your working directory."
##
## This script assumes that the data from the UCI HAR Dataset
## folder (available at https://d396qusza40orc.cloudfront.net/
## getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been
## downloaded and unzipped in the working directory.

## LOAD PACKAGES
library(plyr)
library(dplyr)

## READ IN DATA FROM WORKING DIRECTORY
x_train <- read.table("x_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")
x_test <- read.table("x_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")
activity_labels <- read.table("activity_labels.txt")
feature_names <- read.table("features.txt")

## COMBINE TRAINING AND TEST DATA SETS
x_TrainTest <- rbind(x_train, x_test)
y_TrainTest <- rbind(y_train, y_test)
subject_TrainTest <- rbind(subject_train, subject_test)

## ADD FEATURE NAMES TO COMBINED DATA SET
names(x_TrainTest) <- feature_names[, 2]

## ADD SUFFIXES TO DUPLICATED COLUMN NAMES
## (to resolve errors in next steps)
x_TrainTest2 <- x_TrainTest[,]

## EXTRACT ONLY MEASUREMENTS ON MEAN AND STANDARD DEVIATION
## FOR EACH MEASUREMENT
x_MeanStd <- select(x_TrainTest2, contains("mean()",
                ignore.case = TRUE),
                contains("std()", ignore.case = TRUE))

## USE DESCRIPTIVE ACTIVITY NAMES TO NAME ACTIVITIES IN THE DATA SET
y_TrainTestWithActivityNames <- join(y_TrainTest, activity_labels,
                                     by = "V1", type = "left",
                                     match = "all")
ActivityName <- as.vector(y_TrainTestWithActivityNames[,2], 
                           mode = "any")


## USE DESCRIPTIVE VARIABLE NAMES TO LABEL THE DATA SET

x_MeanStdNames <- as.vector(names(x_MeanStd))
MeanStdVariableNames <- gsub("\\()", "", x_MeanStdNames)
MeanStdVariableNames <- gsub("-mean", "Mean", MeanStdVariableNames)
MeanStdVariableNames <- gsub("-std", "Std", MeanStdVariableNames)
MeanStdVariableNames <- gsub("-", "", MeanStdVariableNames)
MeanStdVariableNames <- gsub("BodyBody", "Body", MeanStdVariableNames)
names(x_MeanStd) <- MeanStdVariableNames

names(subject_TrainTest) <- "SubjectID"


## ADD "SUBJECT ID" AND "ACTIVITY NAME" TO DATA SET
MeanStd_Dataset <- cbind(subject_TrainTest, ActivityName, 
                         x_MeanStd)

## CREATE TIDY DATA SET WITH AVERAGE OF EACH VARIABLE
## FOR EACH ACTIVITY AND EACH SUBJECT
grouped <- group_by(MeanStd_Dataset, SubjectID, ActivityName)
Means_Dataset <- summarise_each(grouped, funs(mean))

## WRITE OUT TIDY DATA SET AS A TXT FILE
write.table(Means_Dataset, file = "avg_by_sub_act_meas.txt",
            row.names = FALSE)
