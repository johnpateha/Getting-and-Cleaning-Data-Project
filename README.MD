## Coursera course "Getting and Cleaning Data"
Project's results. Completed 18.08.2015 by Evgeny Patekha

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


---
title: "README"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
