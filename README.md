---
title: "README"
author: "LALIT KUMAR JIWANI"
date: "May 1, 2016"
output: html_document
---

##############################################################################
The R script called run_analysis.R is created that does the specific tasks using 
following order. 
##############################################################################


## Directory structure and the DATA #####################

The working directory is:
"F:/lalit/books_courses/Data Science _ Coursera_files/Course03_Getting_Cleaning_Data/Test/Week4project"

All the paths are related to this directory.

 The data is lying in "./UCI HAR Dataset" subfolders 

## How the run_analysis.R works ##


### Data Reading ###########
First data is read in R through various files. These includes
   1. training set
   2. test set
   3. labels of activity for training and test data
   4. subject for training and test data
   5. features corresponding to each column variable
   6. Activity labels for each of the activity
   
### Task 01 ###########
The training and the test sets are merged to create one data set

### Task 02 ###########
Only the measurements on the mean and standard deviation for each measurement is extracted.

### Task 03 ###########
Descriptive activity names are used to name the activities in the data set

### Task 04 ###########
Data set is labelled withe the descriptive variable names using the principle 
of tidy data set.

### Task 05 ###########
From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created.

### Tidy data is created in the final step in the file ###########
./UCI_extrated_data_summary.txt


