setwd("c:/My/_BigData/_NewRWorkDir/UCI HAR Dataset")
#q <- t(rbind(feat,new_feat))


run_analysis <- function() {
# This function is result of project for Coursera course 
# "Getting and Cleaning Data"
        
# Project use data sets from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# The folder with unpacked archive should be set as working directory for R

# The Project's goal is to merge all data to one data set,
# to change names to discriptive and create new data set with average data
        
# New dataset variables discribed at "CodeBook.md"
        
# main steps: 
# 1. Load variable names, create list, which consists mean() and std() in names. 
# Change short names to descriptive
# 2. Load and merge X_test and X_train datasets. 
# Use only variables with mean() and std() in features names.
# Assign discriptive names to data set variables, which made before
# 3. Load data with activity and subject variables, merge them similary 
# to X data, assign names Activity and Subject
# 4. Merge all data in one data set
# 5. Label activity data by specific names
# 6. Group data by Subject and Activity for new dataset output 
# and create new data set. It srored in WD as file "DS_Avg.txt"
# also function return new data set as result.
        
# to load file "DS_Avg.txt" use  
#        read.table("DS_Avg.txt", header = TRUE, check.names=FALSE) 
# 
# Attention: this function use library dplyr and it should be installed           
        
        
        # load library dplyr        
        library(dplyr)

        # load feature names from file "features.txt". Use second column         
        feat <- read.table("features.txt", header = FALSE , 
                           stringsAsFactors = FALSE)[,2]
        # find only mean and std features 
        feat_ind1 <- grep("mean()", feat, fixed = TRUE)
        feat_ind2 <- grep("std()", feat, fixed = TRUE)
        feat_ind <- sort(c(feat_ind1,feat_ind2))
        
        # change features names to descriptive names by function discriptivenames 
        new_feat <- discriptivenames(feat)
        
        
        # load data, for x tables use only columns with mean or std features
        X1 <- read.table("test/X_test.txt", header = FALSE)[,feat_ind]
        X2 <- read.table("train/X_train.txt", header = FALSE)[,feat_ind]

        y1 <- read.table("test/y_test.txt", header = FALSE)
        y2 <- read.table("train/y_train.txt", header = FALSE)
        
        S1 <- read.table("test/subject_test.txt", header = FALSE)
        S2 <- read.table("train/subject_train.txt", header = FALSE)

        # merge data test and train and set discriptive column names
        X <- rbind(X1,X2)
        names(X) <- new_feat[feat_ind]

        y <- rbind(y1,y2)
        names(y) <- "Activity"
        
        S <- rbind(S1,S2)
        names(S) <- "Subject"
        
        # merge all variables into one table, convert to DF for use dplyr features
        Data <- tbl_df(cbind(S,y,X))
        
        # load activity labels and set labels to Activity column
        ActLab <- read.table("activity_labels.txt", header = FALSE)
        Data$Activity <- as.factor(Data$Activity)
        levels(Data$Activity) <- ActLab[,2]
        
        # group Data by Subject and Activity for new dataset output
        Data <- group_by(Data, Subject, Activity )
        
        # output - new data data set with average for each Subject and Activity
        Data1 <- summarise_each(Data, funs(mean))
        write.table(Data1, file = "DS_Avg.txt", row.name=FALSE) 
        Data1
}



discriptivenames <- function(x) {
        # function make descriptive feature names
        # change short names to long names using substitution
        # create substitution list and make 2-column table: short and long strings
        substitution_list <- c("BodyBody","Body",
                               "Acc","Acceleration",
                               "Gyro","Gyroscope",
                               "Mag","Magnitude",
                               "tBody","timeBody",
                               "tGravity","timeGravity",
                               "fBody","freqBody",
                               "-mean()","_mean",
                               "-std()","_std",
                               "-mad()","_mad",
                               "-max()","_max",
                               "-min()","_min",
                               "-sma()","_sma",
                               "-energy()","_energy",
                               "-iqr()","_iqr",
                               "-arCoeff()","_arCoeff",
                               "-entropy()","_entropy",
                               "-correlation()","_correlation",
                               "-maxInds()","_maxInds",
                               "-meanFreq()","_meanFreq",
                               "-skewness()","_skewness",
                               "-kurtosis()","_kurtosis",
                               "-bandsEnergy()","_bandsEnergy",
                               "-","_","-","_")
        
        substitution_tbl <- matrix(substitution_list, ncol=2, byrow = TRUE) 
        
        # use substitution table to change names of variables
        for (i in 1:length(substitution_tbl[,1]))
        { 
                x <- sub(substitution_tbl[i,1],substitution_tbl[i,2], x, 
                         fixed = TRUE)
        }
        
        x
}
        
loadMyDS <- function(){
        # function load stored dataset - just specified read parameters
        read.table("DS_Avg.txt", header = TRUE, check.names=FALSE) 
} 




