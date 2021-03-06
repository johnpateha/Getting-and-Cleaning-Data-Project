## Coursera course "Getting and Cleaning Data"
Project completed 18.08.2015 by Evgeny Patekha

## Readme

================================================================================
## Project's result includes the following files:

- README.md
- CodeBook.md - describes the variables, the data, and any transformations of data 
- run_analysis.R - functions to load data from initial dataset, 
merge all data in one dataset, change short variables names to discriptive 
and create new tidy dataset with the average of each variable for each activity 
and each subject.
- DS_Avg.txt - new data set (project's result)

================================================================================

The purpose of this project is to demonstrate ability to collect, work with, 
and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
It required to submit: 
 - a tidy data set as described below, 
 - a link to a Github repository with script for performing the analysis, 
 - a code book that describes the variables, the data, and any transformations 
or work that performed to clean up the data called CodeBook.md. 

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
 
        New_DS <- run_analysis()
 
 ### To load file with new dataset use command 
 
        New_DS <- read.table("DS_Avg.txt", header = TRUE, check.names=FALSE) 


 ### Attention:
 - function use library dplyr and it should be installed
 - working directory should contain unpacked data
        

================================================================================
## About initial dataset


Project use initial data set from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

================================================================================
Initial data set created by 

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - UniversitÓ degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

================================================================================
Initial data set is result of experiments with Samsung smartphone. 
This is brief explanations of experiment:

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear 
acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data 
and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec 
and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using 
a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time 
and frequency domain. See 'features_info.txt' for more details. 

================================================================================
For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) 
and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

================================================================================

The initial dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. 
Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed 
the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal 
from the smartphone accelerometer X axis in standard gravity units 'g'. 
Every row shows a 128 element vector. The same description applies for the 
'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal 
obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector 
measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
- Features are normalized and bounded within [-1,1]
- Each feature vector is a row on the text file
