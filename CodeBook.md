Project CodeBook

INPUT AND OUTPUT DATA

As indicated on the README file, the original dataset can be downloaded from the following link (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). It contains a series of text files that describes every column of the dataset. 

Using the above-mentioned files as a starting point, we can describe the key components of our table in terms of how they came from the original. The analysis.R program will create a data table in your working directory named "tidy_dataset.txt"
1) tidy_dataset has 180 rows and 81 columns
- The "subject column" is the unique marker for each the 30 subjects
- The "activity_description" indicates which of the 6 activities the subject performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- The remaining 79 columns are a mean of all the observations, by subject and by activity, for all the variable columns in the original dataset that had a mean or std in the title.

KEY SCRIPT FEATURES

read.tables was used extensively to load the data for manipulation. In order for this section to work properly, you need to save the unzipped folder to your working directory (the unzipped file should be named UCI HAR Dataset)
rbind and cbind were used to combine the "test" and "training" datasets into one. Both of these datasets have the same columns (i.e. variables) but different number of observations (read the link on the readme file for more details on these two tables)
grepl was used to create a logical vector for those column that matched the criteria of containing the following words: "mean|std|activity_label|activity_description|subject", then we subset the data to keep only these columns)
aggregate was used pivot the data by subject and activity, with the remaining columns consolidated in a calculation of their mean value.
