## Coursera course "Getting and Cleaning Data"
Project completed 18.08.2015 by Evgeny Patekha

## CodeBook

================================================================================
This file describes the data, the variables, and transformations of data

================================================================================

## Datasource 

Project uses data from archive, which contains result of experiments with 
Samsung smartphone. 

Source link 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Discription of the dataset see in archive.

It is very important to set folder with unpacked archive as working directory for R

================================================================================

## Task

Created one R script called run_analysis.R that does the following: 
 - Merges the training and the test sets to create one data set.
 - Extracts only the measurements on the mean and standard deviation 
for each measurement. 
 - Uses descriptive activity names to name the activities in the data set
 - Appropriately labels the data set with descriptive variable names.
 - From the data set in prev step, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

================================================================================

## Work discription

 - Load variable names from file "features.txt", create index list, 
 which contains mean() and std() in names. Change short names to descriptive.
 Use substitution function for change names. Substitution patterns made manually
 
"BodyBody"-"Body",
"Acc"-"Acceleration",
"Gyro"-"Gyroscope",
"Mag"-"Magnitude",
"tBody"-"timeBody",
"tGravity"-"timeGravity",
"fBody"-"freqBody",
"-mean()"-"_mean",
"-std()"-"_std",
"-mad()"-"_mad",
"-max()"-"_max",
"-min()"-"_min",
"-sma()"-"_sma",
"-energy()"-"_energy",
"-iqr()"-"_iqr",
"-arCoeff()"-"_arCoeff",
"-entropy()"-"_entropy",
"-correlation()"-"_correlation",
"-maxInds()"-"_maxInds",
"-meanFreq()"-"_meanFreq",
"-skewness()"-"_skewness",
"-kurtosis()"-"_kurtosis",
"-bandsEnergy()"-"_bandsEnergy",
"-"-"_"


 - Load and merge X_test and X_train datasets. Use only variables with mean()
 and std() in features names. Assign discriptive names to merged dataset's 
 variables, which made before
 - Load data with activity and subject variables, merge them similary to X data, 
 assign names "Activity"" and "Subject"
 - Merge all data in one data set
 - Label activity data by specific names from file "activity_labels.txt"
 - Group data by Subject and Activity for new dataset output and create 
 new data set. It srored in WD as file "DS_Avg.txt". Also function return new 
 data set as result.
 
 ================================================================================

 ### To run scrypt use command
 
        New_DS <- run_analysis() .
 
 ### To load file with new dataset use command 
 
        New_DS <- read.table("DS_Avg.txt", header = TRUE, check.names=FALSE) 


 ### Attention: function use library dplyr and it should be installed
 ### Working directory should contain unpacked data
        
 ================================================================================

## New dataset description

New dataset contains 180 rows and 68 variables

Each rows - average data of measurment 30 subjects of experiment through 6 activity:
 - WALKING
 - WALKING_UPSTAIRS
 - WALKING_DOWNSTAIRS
 - SITTING
 - STANDING
 - LAYING

There is 3 group variables in the dataset

- Subject and Activity, as described above
- Mean function for set of variables (_mean)
- Standart deviation for set of variables (_std)

Set of variables - 33 different measurements

The variables come from the accelerometer and gyroscope 3-axial signals. 

Subsequently, the body linear acceleration and angular velocity were derived 
in time to obtain Jerk signals (timeBodyAccelerationJerk_XYZ and 
timeBodyGyroscopeJerk_XYZ). Also the magnitude of these three-dimensional 
signals were calculated using the Euclidean norm (timeBodyAccelerationMagnitude, 
timeGravityAccelerationMagnitude, timeBodyAccelerationJerkMagnitude, 
timeBodyGyroscopeMag, timeBodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing freqBodyAcceleration_XYZ, freqBodyAccelerationJerk_XYZ, 
freqBodyGyroscope_XYZ, freqBodyAccelerationJerkMagnitude, freqBodyGyroscopeMagnitude, freqBodyGyroscopeJerkMagnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


"timeBodyAcceleration_X"
"timeBodyAcceleration_Y"
"timeBodyAcceleration_Z"
"timeGravityAcceleration_X"
"timeGravityAcceleration_Y"
"timeGravityAcceleration_Z"
"timeBodyAccelerationJerk_X"
"timeBodyAccelerationJerk_Y"
"timeBodyAccelerationJerk_Z"
"timeBodyGyroscope_X"
"timeBodyGyroscope_Y"
"timeBodyGyroscope_Z"
"timeBodyGyroscopeJerk_X"
"timeBodyGyroscopeJerk_Y"
"timeBodyGyroscopeJerk_Z"
"timeBodyAccelerationMagnitude"
"timeGravityAccelerationMagnitude"
"timeBodyAccelerationJerkMagnitude"
"timeBodyGyroscopeMagnitude"
"timeBodyGyroscopeJerkMagnitude"
"freqBodyAcceleration_X"
"freqBodyAcceleration_Y"
"freqBodyAcceleration_Z"
"freqBodyAccelerationJerk_X"
"freqBodyAccelerationJerk_Y"
"freqBodyAccelerationJerk_Z"
"freqBodyGyroscope_X"
"freqBodyGyroscope_Y"
"freqBodyGyroscope_Z"
"freqBodyAccelerationJerkMagnitude"
"freqBodyGyroscopeMagnitude"
"freqBodyGyroscopeJerkMagnitude"
