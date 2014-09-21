==================================================================
Coursera - Getting and Cleaning Data - Course Project  
==================================================================
Eric Djatsa
https://github.com/ericdjatsa/getting_cleaning_data
==================================================================

The purpose of the scripts in the repository is to build a tidy data set from experiment data on Human Activity Recognition using smartphones.
More detailled instructions can be found on the Coursera website : https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions

## Instructions for building the tidy data set ##
   
    1.  clone this repository using :
	    git clone https://github.com/ericdjatsa/getting_cleaning_data 
    2.  move to the folder where you cloned the repository and download the source zipped data file from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	3.  Unzip the downloaded file to a sub-folder named 'UCI_HAR_Dataset'
	4.  execute the R script run_analysis.R in the folder containing the UCI_HAR_Dataset folder, the outcome will be a file named __UCI_HAR_Tidy_Dataset.txt__ 
	    ( created in the same folder containing the R script __run_analysis.R__ )
	    containing the required tidy data set. All information on variables contained in the tidy data can be found in the __CodeBook.md__ file .

## Files in this repository ##

*   __run_analysis.R__ : R script file to be executed in order to build the tidy data

*   __CodeBook.md__ : file describing the variables in the tidy data

*   __README.md__   : file describing how to use the content of this repository