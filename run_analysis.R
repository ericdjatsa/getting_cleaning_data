## Coursera - Getting and Cleaning Data - Course Project
## Eric Djatsa - https://github.com/ericdjatsa
## Purpose : create a tidy data set from experiment data on Human Activity Recognition using smartphones

# Check if source folder exists in working dir
if(!file.exists("./UCI_HAR_Dataset")){
        stop(" Expected source Error folder 'UCI_HAR_Dataset' was not found! Please make sure you create it as explained in the README.md file")
}

# Read data

## Common data

# First read the features data
features_all <- read.table("./UCI_HAR_Dataset/features.txt",stringsAsFactors = FALSE)
names(features_all) <- c("featureID","featureName")

# Now read the activity labels description
activity_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", stringsAsFactors = FALSE)
names(activity_labels) <- c("activityID","activityName")

## Train and Test data


## Train set 

# Read the train subjects
subject_train <- read.table("./UCI_HAR_Dataset/train/subject_train.txt",stringsAsFactors = FALSE)
names(subject_train) <- c("subjectID")

# Train Activity label 
train_act_labels <- read.table("./UCI_HAR_Dataset/train/y_train.txt",stringsAsFactors = FALSE)
names(train_act_labels) <- c("activityID")
# Add the activity Names
train_act_labels$activityName <- sapply(train_act_labels$activityID,function(x){activity_labels[activity_labels$activityID == x,"activityName"]})

# now read train set measurements
# NB : Since we know that all measurements are of numeric type ,
# we set the columns classes to numeric so the the data will be read faster
train_set <- read.table("./UCI_HAR_Dataset/train/X_train.txt",colClasses = "numeric")

# Set the names of each feature in the train set
names(train_set) <- features_all$featureName

# Now complete train set with all the information gathered above
# activity ID, activity label and subjectID
train_set <- cbind(train_act_labels,train_set)
train_set <- cbind(subject_train,train_set)


## Test set 

# Read the test subjects
subject_test <- read.table("./UCI_HAR_Dataset/test/subject_test.txt",stringsAsFactors = FALSE)
names(subject_test) <- c("subjectID")

# Test Activity label 
test_act_labels <- read.table("./UCI_HAR_Dataset/test/y_test.txt",stringsAsFactors = FALSE)
names(test_act_labels) <- c("activityID")
# Add the activity Names
test_act_labels$activityName <- sapply(test_act_labels$activityID,function(x){activity_labels[activity_labels$activityID == x,"activityName"]})

# now read test set measurements
# NB : Since we know that all measurements are of numeric type ,
# we set the columns classes to numeric so the the data will be read faster
test_set <- read.table("./UCI_HAR_Dataset/test/X_test.txt",colClasses = "numeric")

# Set the names of each feature in the test set
names(test_set) <- features_all$featureName

# Now complete test set with all the information gathered above :
# activity ID, activity label and subjectID

test_set <- cbind(test_act_labels,test_set)
test_set <- cbind(subject_test,test_set)

## Finaly merge train and test data sets : combine the rows of both data sets
mergedData <- rbind(train_set,test_set)


# Now we need to Extracts only the measurements on the mean 
# and standard deviation for each measurement.

# First we need to build a feature set with only the measurements 
# on the mean and standard deviation for each measurement
# In order to achieve this, we use grep on the feature names 
# and we keep only the feature names that contains 'mean()' or 'std()' 
featureCols2keep_regexp <- grep("mean\\(\\)|std\\(\\)",features_all$featureName)
featureCols2keep_df <- features_all[featureCols2keep_regexp,]

# Create the columns list to keep
featureCols2keep <- featureCols2keep_df$featureName

# Now Build the data set with only the measurements 
# on the mean and standard deviation for each measurement
# by removing the columns computed above
mergedData <- mergedData[,c("subjectID","activityName",featureCols2keep)]

# Now create a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

# We need to install reshape2 package if it is not yet installed
if(!("reshape2" %in% installed.packages()[,"Package"])){
        install.packages("reshape2")
}
# Load package reshape2
library(reshape2)

# Melt the data using subjectID and activityName as IDs
melt_data <- melt(mergedData, id=c("subjectID","activityName"),measure.vars=featureCols2keep)

# Now compute the mean of the other measurement variables
tidy_data <- dcast(melt_data, subjectID + activityName ~ variable,mean)

# Finally write the tidy data to a file
write.table(tidy_data,file = "UCI_HAR_Tidy_Dataset.txt",row.names = FALSE)
message("Done! Tidy data written to file 'UCI_HAR_Tidy_Dataset.txt'.")
