Coursera - Getting and Cleaning Data - Course Project  
=====================================================

## Data sources ##
The data used to build this tidy data set come from Coursera lecture Getting and Cleaning Data course project accessible at https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions.
This data itself was collected from an experiment of Human activity recognition using smartphones, more information about this original experiment can be found at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

## Data set variables ##
The columns in the data set are the following : 

1	subjectID : Identifier of a subject on which the experiment was carried out. Ranges from 1 to 30
2	activityName : Name of the activity on which the measurement was performed. Values are : WALKING,WALKING_UPSTAIRS,WALKING_DOWNSTAIRS,SITTING,STANDING,LAYING
	
The remaining 66 variables are averages of the corresponding variables names (mean and standard deviation) in the original dataset, aggregated by subjectID and activityName
3	tBodyAcc-mean()-X 
4	tBodyAcc-mean()-Y
5	tBodyAcc-mean()-Z
6	tBodyAcc-std()-X
7	tBodyAcc-std()-Y
8	tBodyAcc-std()-Z
9	tGravityAcc-mean()-X
10	tGravityAcc-mean()-Y
11	tGravityAcc-mean()-Z
12	tGravityAcc-std()-X
13	tGravityAcc-std()-Y
14	tGravityAcc-std()-Z
15	tBodyAccJerk-mean()-X
16	tBodyAccJerk-mean()-Y
17	tBodyAccJerk-mean()-Z
18	tBodyAccJerk-std()-X
19	tBodyAccJerk-std()-Y
20	tBodyAccJerk-std()-Z
21	tBodyGyro-mean()-X
22	tBodyGyro-mean()-Y
23	tBodyGyro-mean()-Z
24	tBodyGyro-std()-X
25	tBodyGyro-std()-Y
26	tBodyGyro-std()-Z
27	tBodyGyroJerk-mean()-X
28	tBodyGyroJerk-mean()-Y
29	tBodyGyroJerk-mean()-Z
30	tBodyGyroJerk-std()-X
31	tBodyGyroJerk-std()-Y
32	tBodyGyroJerk-std()-Z
33	tBodyAccMag-mean()
34	tBodyAccMag-std()
35	tGravityAccMag-mean()
36	tGravityAccMag-std()
37	tBodyAccJerkMag-mean()
38	tBodyAccJerkMag-std()
39	tBodyGyroMag-mean()
40	tBodyGyroMag-std()
41	tBodyGyroJerkMag-mean()
42	tBodyGyroJerkMag-std()
43	fBodyAcc-mean()-X
44	fBodyAcc-mean()-Y
45	fBodyAcc-mean()-Z
46	fBodyAcc-std()-X
47	fBodyAcc-std()-Y
48	fBodyAcc-std()-Z
49	fBodyAccJerk-mean()-X
50	fBodyAccJerk-mean()-Y
51	fBodyAccJerk-mean()-Z
52	fBodyAccJerk-std()-X
53	fBodyAccJerk-std()-Y
54	fBodyAccJerk-std()-Z
55	fBodyGyro-mean()-X
56	fBodyGyro-mean()-Y
57	fBodyGyro-mean()-Z
58	fBodyGyro-std()-X
59	fBodyGyro-std()-Y
60	fBodyGyro-std()-Z
61	fBodyAccMag-mean()
62	fBodyAccMag-std()
63	fBodyBodyAccJerkMag-mean()
64	fBodyBodyAccJerkMag-std()
65	fBodyBodyGyroMag-mean()
66	fBodyBodyGyroMag-std()
67	fBodyBodyGyroJerkMag-mean()
68	fBodyBodyGyroJerkMag-std()

## Data Transformations ##
The source data was contained in a zipped source folder downloaded from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Initially there were 2 data sets : a train data set and a test data set containing several measurement variables ( more precisily 561 variables) .
These 2 datasets were merged together into a single data set by combining the rows in each data set. 
Only the measurements on the mean and standard deviation for each measurement were extracted from the merged data then 
the first 2 colums of the final data set : subjectID and activityName where added by joining data from additional files in the source folder. 

Finally the averages of each variable for each activity and each subject were computed to build the output tidy data.
The tidy data contains one record ( row ) for each pair ( subjectID , activityName) 