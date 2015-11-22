
##R Script

Sourcing and running the run_analysis.R script will 
process and clean data from the UCI HAR Dataset and create
a tidy data set that is a table of averages of means 
and standard deviations of multiple observations,
sorted by measurement variable, subject, and activity.

As specfied in the Course Project Instructions
"The code should have a file run_analysis.R in the
main directory that can be run as long as the
Samsung data is in your working directory."

This script assumes that the data from the UCI HAR Dataset
folder (available at https://d396qusza40orc.cloudfront.net/
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been
downloaded and unzipped in the working directory.

The script processes and cleans the original data by doing the following:
1. Merging the training and test sets to create one data set.
2. Extracting on the measurements on the mean and standard deviation
   for each measurement.
3. Using descriptive activity names to name the activities in the data set.
4. Appropriately labeling the data set with descriptive variable names.
5. Creating a second independent tidy data det with the average of each
   variable for each activity and each subject.
   
Specifically, the run_analysis.R script will
1.  Load plyr and dplyr packages.
2.  Read in relevant test and training files from the UCI HAR Dataset
    (containing measurements, variable names, activity names, and
    subject IDs). 
3.  Combine the test and training data sets (measurements).
4.  Add variable names to combined data set (measurements).
5.  Extract only measurements on mean and standard deviation
    for each measurement. Note that this is done by selecting
    variables with names including "mean()" or "std()".
6.  Substitute descriptive activity names (WALKING, WALKING_UPSTAIRS,
    WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) for the numbers (1-6)
    used in the original data set.
7.  Change the measurement variable names to more concise camel case
    names while eliminating "()", "-", and typographical errors.
8.  Rename variable names V1 and V2 to SubjectID and ActivityName.
9.  Merge SubjectID and ActivityName variables with the measurement
    variables to create a complete tidy data set.
10. Create a new tidy data set by taking the average of each 
    measurement variable (each of which is either a mean or a 
    standard deviation) for each subject/activity pair.   
11. Write out the tidy data set called avg_by_sub_act_meas.txt.
