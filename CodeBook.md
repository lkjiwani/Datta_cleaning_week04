---
title: "CodeBook"
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
 
 - 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

## How the run_analysis.R works ##


### Data Reading ###########
First data is read in R through various files. These includes
   1. training set
   2. test set
   3. labels of activity for training and test data
   4. subject for training and test data
   5. features corresponding to each column variable
   6. Activity labels for each of the activity
   
### The run_analysis.R does the following 05 tasks ###########
- The training and the test sets are merged to create one data set
- Only the measurements on the mean and standard deviation for each measurement is extracted.
- Descriptive activity names are used to name the activities in the data set
- Data set is labelled withe the descriptive variable names using the principle 
of tidy data set.
- From the data set in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created.

## Tidy data is created in the final step in the file ###########
./UCI_extrated_data_summary.txt

## Following transformations for Variable names are done to transform to tidy names
## Tidy variable names by following transformation
#### substituting "-" with ""
#### substituting "(" with ""
#### substituting ")" with ""
#### substituting variable begining with"t" with "time"
#### substituting variable begining with"f" with "freq"


### Variable Names for From the data set obtaned after applying to data extracted in step 4, a second, independent tidy data set with the average of each variable for each activity and each subject is created ####
"Activity" "Subject" "timeBodyAccmeanX" "timeBodyAccmeanY" "timeBodyAccmeanZ" "timeGravityAccmeanX" "timeGravityAccmeanY" "timeGravityAccmeanZ" "timeBodyAccJerkmeanX" "timeBodyAccJerkmeanY" "timeBodyAccJerkmeanZ" "timeBodyGyromeanX" "timeBodyGyromeanY" "timeBodyGyromeanZ" "timeBodyGyroJerkmeanX" "timeBodyGyroJerkmeanY" "timeBodyGyroJerkmeanZ" "timeBodyAccMagmean" "timeGravityAccMagmean" "timeBodyAccJerkMagmean" "timeBodyGyroMagmean" "timeBodyGyroJerkMagmean" "freqBodyAccmeanX" "freqBodyAccmeanY" "freqBodyAccmeanZ" "freqBodyAccmeanFreqX" "freqBodyAccmeanFreqY" "freqBodyAccmeanFreqZ" "freqBodyAccJerkmeanX" "freqBodyAccJerkmeanY" "freqBodyAccJerkmeanZ" "freqBodyAccJerkmeanFreqX" "freqBodyAccJerkmeanFreqY" "freqBodyAccJerkmeanFreqZ" "freqBodyGyromeanX" "freqBodyGyromeanY" "freqBodyGyromeanZ" "freqBodyGyromeanFreqX" "freqBodyGyromeanFreqY" "freqBodyGyromeanFreqZ" "freqBodyAccMagmean" "freqBodyAccMagmeanFreq" "freqBodyBodyAccJerkMagmean" "freqBodyBodyAccJerkMagmeanFreq" "freqBodyBodyGyroMagmean" "freqBodyBodyGyroMagmeanFreq" "freqBodyBodyGyroJerkMagmean" "freqBodyBodyGyroJerkMagmeanFreq" "angletBodyAccMean,gravity" "angletBodyAccJerkMean,gravityMean" "angletBodyGyroMean,gravityMean" "angletBodyGyroJerkMean,gravityMean" "angleX,gravityMean" "angleY,gravityMean" "angleZ,gravityMean" "timeBodyAccstdX" "timeBodyAccstdY" "timeBodyAccstdZ" "timeGravityAccstdX" "timeGravityAccstdY" "timeGravityAccstdZ" "timeBodyAccJerkstdX" "timeBodyAccJerkstdY" "timeBodyAccJerkstdZ" "timeBodyGyrostdX" "timeBodyGyrostdY" "timeBodyGyrostdZ" "timeBodyGyroJerkstdX" "timeBodyGyroJerkstdY" "timeBodyGyroJerkstdZ" "timeBodyAccMagstd" "timeGravityAccMagstd" "timeBodyAccJerkMagstd" "timeBodyGyroMagstd" "timeBodyGyroJerkMagstd" "freqBodyAccstdX" "freqBodyAccstdY" "freqBodyAccstdZ" "freqBodyAccJerkstdX" "freqBodyAccJerkstdY" "freqBodyAccJerkstdZ" "freqBodyGyrostdX" "freqBodyGyrostdY" "freqBodyGyrostdZ" "freqBodyAccMagstd" "freqBodyBodyAccJerkMagstd" "freqBodyBodyGyroMagstd" "freqBodyBodyGyroJerkMagstd"



