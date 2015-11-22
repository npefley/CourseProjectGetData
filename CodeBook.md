

##Project Description
The purpose of this project was to collect, work with, and clean a data set. The 
ultimate goal was to prepare a tidy data set that could be used for later analysis.
The tidy data set produced is a table of averages of means and standard deviations of
multiple observations, sorted by measurement variable, subject, and activity.

##Original Data
The original data (available at https://d396qusza40orc.cloudfront.net/
getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) was collected from 30 
subjects, with an age bracket of 19-48 years, who wore a Samsung Galaxy S II
smartphone on the waist while performing six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING LAYING). Accelerometer
and gyroscope measurements captured 3-axial linear acceleration and 3-axial
angular velocity. The sensor acceleration signal separated into body acceleration
and gravity. A vector of features was obtained by calculating variables from the
time (t) and frequency (f) domains.  

##Project Design and Data Processing
Processing and cleaning the original data involved the following:
1. Merging the training and test sets to create one data set.
2. Extracting on the measurements on the mean and standard deviation
   for each measurement.
3. Using descriptive activity names to name the activities in the data set.
4. Appropriately labeling the data set with descriptive variable names.
5. Creating a second independent tidy data det with the average of each
   variable for each activity and each subject.
   
##Description of the Variables in the avg_by_sub_act_meas.txt file
 - Dimension: 180 observations by 68 variables
 - 1 variable is SubjectID (numeric from 1 to 30) to identify
   each unique subject.
 - 1 variable is ActivityName (WALKING, WALKING_UPSTAIRS,
   WALKING_DOWNSTAIRS, SITTING, STANDING LAYING)
 - 66 variables are averages of means and standard deviations of
   measurements from multiple observation of subjects performing 
   each of the 6 activities.
 - The 180 observations are averages of means and standard deviations
   from 30 subjects performing each of the 6 activities listed above.
 - The original data was normalized, ranging from -1 to 1.  
 - Variables present in the dataset
   * SubjectID - Numeric (1-30) representing each of the 30 subjects.
   * ActivityName - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
     STANDING, LAYING.
   * The remaining variables are the averages of means and  
     standard deviations of observations of subject-activity pairs.
     The variable names consist of multiple components:
     - t - calculated from the time domain
     - f - calculated from the frequency domain
     - BodyAcc - body acceleration from accelerometer
     - BodyAcc - body acceleration magnitude from accelerometer
     - BodyAccJerk - body acceleration jerk from accelerometer
     - BodyAccJerkMag - body acceleration jerk magnitude from accelerometer
     - BodyGyro - body gyroscopic angular velocity
     - BodyGyroMag - body gyroscopic magnitude
     - BodyGyroJerk - body gyroscopic jerk
     - BodyGyroJerkMag - body gyroscopic jerk magnitude
     - GravityAcc - gravity acceleration
     - GravityAccMag - gravity acceleration magnitude
     - x, y, z - direction of the triaxial direction
     - Mean, Std - mean or standard deviation
     - List of Variable Names (all are averages of means and standard
       deviations over multiple observations): tBodyAccMeanX, tBodyAccMeanY,
       tBodyAccMeanZ, tGravityAccMeanX, tGravityAccMeanY, tGravityAccMeanZ,
       tBodyAccJerkMeanX, tBodyAccJerkMeanY, tBodyAccJerkMeanZ, tBodyGyroMeanX,d
       tBodyGyroMeanY, tBodyGyroMeanZ, tBodyGyroJerkMeanX, tBodyGyroJerkMeanY,
       tBodyGyroJerkMeanZ, tBodyAccMagMean, tGravityAccMagMean,
       tBodyAccJerkMagMean, tBodyGyroMagMean, tBodyGyroJerkMagMean,
       fBodyAccMeanX, fBodyAccMeanY, fBodyAccMeanZ, fBodyAccJerkMeanX,
       fBodyAccJerkMeanY, fBodyAccJerkMeanZ, fBodyGyroMeanX, fBodyGyroMeanY,
       fBodyGyroMeanZ,fBodyAccMagMean, fBodyAccJerkMagMean, fBodyGyroMagMean,
       fBodyGyroJerkMagMean, tBodyAccStdX, tBodyAccStdY, tBodyAccStdZ,
       tGravityAccStdX, tGravityAccStdY, tGravityAccStdZ, tBodyAccJerkStdX,
       tBodyAccJerkStdY, tBodyAccJerkStdZ, tBodyGyroStdX, tBodyGyroStdY,
       tBodyGyroStdZ, tBodyGyroJerkStdX, tBodyGyroJerkStdY, tBodyGyroJerkStdZ,
       tBodyAccMagStd, tGravityAccMagStd, tBodyAccJerkMagStd, tBodyGyroMagStd,
       tBodyGyroJerkMagStd, fBodyAccStdX, fBodyAccStdY, fBodyAccStdZ,
       fBodyAccJerkStdX, fBodyAccJerkStdY, fBodyAccJerkStdZ, fBodyGyroStdX,
       fBodyGyroStdY, fBodyGyroStdZ, fBodyAccMagStd, fBodyAccJerkMagStd,
       fBodyGyroMagStd,fBodyGyroJerkMagStd.

