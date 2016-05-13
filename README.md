# Getting-And-Cleaning-Data-Course-Project

The run_analysis.R is a program that cleans the data and calculates the mean value for a set of variables. These variables came from a  larger dataset that was generated during an experiment on Human Activity Recognition, you can find more details on the experiment here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis program, in essense, perform the following steps:
  1) Loads the data
  2) Labels the columns
  3) row-binds two major tables
  4) Adds a descriptive activity label column
  5) subsets the columns only keeping those listing the subject, activity type, and  with "mean" or "std" in the column name
  6) pivots the data by subject and activity type and calculates the mean for all the variable columns that had "mean" or "std" in the name.

The original dataset can be retrieved from the following link, once you extract the zip file, save the folder in your working directory.
This will allow the program to run without issue.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Further explanations of the program can be found within the R file and on the CodeBook.
