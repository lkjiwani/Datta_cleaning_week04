## This is the code for the Project for the week 04##
## This is named as "run_analysis.R" file containing the code for the exercise for Week 04 ##
## The tasks have been divided in four parts ##

## The working directory is ##
## setwd("F:/lalit/books_courses/Data Science _ Coursera_files/Course03_Getting_Cleaning_Data/Test/Week4project") ##
## The data is lying in "./UCI HAR Dataset" subfolders #

##Before each task is attempted, the data is read in the R enviornment ##
##Now we describe each part ##

#######################
## Data reading part ##
#######################

trainData <- read.table("./UCI HAR Dataset/train/X_train.txt") #training data
dim(trainData)
#[1] 7352  561
head(trainData)

testData <- read.table("./UCI HAR Dataset/test/X_test.txt") #test data
dim(testData)
#[1] 2947  561
head(testData)

#These data does not specify the variable names

## Now we get the label of activity (identified from 1 to 6), which is 
## same size as number of records in training data
Activity_trainData <- read.table("./UCI HAR Dataset/train/Y_train.txt")
dim(Activity_trainData)
#[1] 7352  1
head(Activity_trainData)

## Now we get the label of activity (identified from 1 to 6), which is 
## same size as number of records in test data
Activity_testData <- read.table("./UCI HAR Dataset/test/Y_test.txt")
dim(Activity_testData)
#[1] 2947  1
head(Activity_testData)

##Now we get who is doing activity (identified from 1 to 30)
subject_trainData <- read.table("./UCI HAR Dataset/train/subject_train.txt")
dim(subject_trainData)
#[1] 7352  1
head(subject_trainData)

subject_testData <- read.table("./UCI HAR Dataset/test/subject_test.txt")
dim(subject_testData)
#[1] 2947    1
head(subject_testData)

##Now we get the names of the columns in the data set
featuresData <- read.table("./UCI HAR Dataset/features.txt")
dim(featuresData)
#[1] 561  2
head(featuresData)

##Activity labels corresponding to each of actvity (from 1 to 6)
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
dim(activity_labels)
#[1] 6 2


############# TASK 01 ########################################
## Merging the training and test sets to create one data set.##
###############################################################

#Since the data corresponding to the same variables we can merge 
#them row wise
training_test_Data <- rbind(trainData, testData)
dim(training_test_Data)
#[1] 10299   561


############ TASK 02##################################################
## Extract only the measurements on the mean and standard deviation ##
##for each measurement################################################

#featuresData[[2]] contain the features
meanindex <- grep("[mM]ean", featuresData[[2]]) #to grep the mean
stdindex <- grep("std", featuresData[[2]]) #to grep the standard deviation

combinedindex <- c(meanindex, stdindex) # combined the index

mean_std_total_data <- training_test_Data[combinedindex] #Extract the data 
#Total data selected corresponding to mean and standard deviation
dim(mean_std_total_data)
#[1] 10299    86


######### TASK 03########################################################
## Uses descriptive activity names to name the activity in the data set##
#########################################################################

#mean_std_total_data is the data containing the 86 mean and std features

## Activity_trainData contains the activity for training data
#[1] 7352  1
#Activity_testData contains the activity for test data
#[1] 2947  1
Activity_Data <- rbind(Activity_trainData, Activity_testData)
dim_Activity_Data <- dim(Activity_Data)
# We will assign the activity labels based on their correspondence
Var2 <- as.data.frame("") # We define a temp variable to store the values
for (i in 1 : dim_Activity_Data[1]) {
  #print(Activity_Data[[1]][i]);
  if (Activity_Data[[1]][i] == 1) 
  {Var2[i] = (activity_labels[[2]][1])}
  else if(Activity_Data[[1]][i] == 2)
  {Var2[i] = (activity_labels[[2]][2])}
  else if(Activity_Data[[1]][i] == 3)
  {Var2[i] = (activity_labels[[2]][3])}
  else if(Activity_Data[[1]][i] == 4)
  {Var2[i] = (activity_labels[[2]][4])}
  else if(Activity_Data[[1]][i] == 5)
  {Var2[i] = (activity_labels[[2]][5])}
  else 
  {Var2[i] = (activity_labels[[2]][6])}
}
Var3 <- as.data.frame(t(Var2)) #take the transpose
library(dplyr)
Var3 <- rename(Var3, Activity = V1) #Naming the column as "Activity"
#This is a column containing the activity names for the complete 
#training+test data
#Append in the column of "mean_std_total_data" 

mean_std_total_data_Activity <- cbind(mean_std_total_data, Var3) #The last column (87) contains activity data
dim(mean_std_total_data_Activity)
head(mean_std_total_data_Activity)


######## TASK 04 #####################################################
## Appropriately labels the data set with descriptive vairable names.#
######################################################################

#combinedindex <- c(meanindex, stdindex) # combined the index
#mean_std_trn_data <- training_test_Data[combinedindex]
mean_std_total_data_feature <- mean_std_total_data
names(mean_std_total_data_feature) <- featuresData[[2]][combinedindex]
extracted_data_Activity <- cbind(mean_std_total_data_feature, Var3) #The last column (87) contains activity data
head(extracted_data_Activity)
dim(extracted_data_Activity)

######### TASK 05 ##########################################################
## From the data set in step 4, creates a second, independent tidy data set##
## with the averages of each variable for each activity and each subject ####

#Activity data are in following data frames
# Activity_trainData and #Activity_testData

# They are combined with "Activity" in extracted_data_Activity

#Subject data are in following data frames
# subject_trainData and # subject_testData


subject_Data <- rbind(subject_trainData, subject_testData)
Var4 <- subject_Data
Var4 <- rename(Var4, Subject = V1)
extracted_data_Subject <- cbind(mean_std_total_data_feature, Var4)

#Make Tidy data by each of "Activity" and "Subject"

extracted_data_Activity_tidy <- extracted_data_Activity
dim(extracted_data_Activity_tidy)
extracted_data_Subject_tidy <- extracted_data_Subject
dim(extracted_data_Activity_tidy)

extracted_data_Activity_Subject <- cbind(extracted_data_Activity, Var4)
dim(extracted_data_Activity_Subject)
extracted_data_Activity_Subject_tidy <- extracted_data_Activity_Subject

#Tidy variable names by following transformation
# substituting "-" with ""
# substituting "(" with ""
# substituting ")" with ""
# substituting variable begining with"t" with "time"
# substituting variable begining with"f" with "freq"

names_extracted_data_Activity_Subject_tidy <- gsub("-", "", names(extracted_data_Activity_Subject_tidy))
names_extracted_data_Activity_Subject_tidy <- gsub("\\(", "", names_extracted_data_Activity_Subject_tidy)
names_extracted_data_Activity_Subject_tidy <- gsub("\\)", "", names_extracted_data_Activity_Subject_tidy)
names_extracted_data_Activity_Subject_tidy <- gsub("^t", "time", names_extracted_data_Activity_Subject_tidy)
names_extracted_data_Activity_Subject_tidy <- gsub("^f", "freq", names_extracted_data_Activity_Subject_tidy)
names(extracted_data_Activity_Subject_tidy) <- names_extracted_data_Activity_Subject_tidy



library(dplyr)
data_by_Activity <- group_by(extracted_data_Activity, Activity)
data_by_Subject <- group_by(extracted_data_Subject_tidy, Subject)
data_by_Activity_Subject <- group_by(extracted_data_Activity_Subject_tidy, Activity, Subject)


#Finding the mean by the groups "Activity" and "Subject"
library(plyr)

UCI_extrated_data_summary <- summarize_each(data_by_Activity_Subject, funs(mean))
dim(UCI_extrated_data_summary)
#[1] 180  88

##Writing Data  ####
write.table(UCI_extrated_data_summary, file="./UCI_extrated_data_summary.txt", row.name=FALSE)