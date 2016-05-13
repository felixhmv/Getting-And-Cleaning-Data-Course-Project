#We start by loading the training data sets
#You'll need to extract the zip file and move the folder to your working directory
training_data <- read.table("UCI HAR Dataset\\train\\X_train.txt")
training_label <- read.table("UCI HAR Dataset\\train\\y_train.txt")
training_subject <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

test_data <- read.table("UCI HAR Dataset\\test\\X_test.txt")
test_label <- read.table("UCI HAR Dataset\\test\\y_test.txt")
test_subject <- read.table("UCI HAR Dataset\\test\\subject_test.txt")

#Before merging, let's rename the columns
#We also need to load the table with the features since those are the columns labels for the main data
features <- read.table("UCI HAR Dataset\\features.txt")
names(training_data)<- features[,2]
names(test_data) <- features[,2]
names(training_label)<- "activity_label"
names(test_label)<- "activity_label"
names(training_subject) <- "subject"
names(test_subject) <- "subject"


#We will now bind the columns and rows in order to create a joint file
#first we bind the columns of each, then combine the rows
merged_data <- 
  rbind(cbind(training_subject, training_label, training_data),
  cbind(test_subject, test_label, test_data))

#The following code loads the activity table and then merges it with the existing data set
#This will create a new column called activity_description which explains in more details what the subject is doing
activity <- read.table("UCI HAR Dataset\\activity_labels.txt")
names(activity) <- c("activity_label", "activity_description")
merged_data <-  merged_data <- merge(activity,merged_data,by="activity_label")

#We will now create a logical vector that identifies those columns with a mean or a std calculation
#But I also want to keep my activity and subject columns!
test <- grepl("mean|std|activity_label|activity_description|subject",names(merged_data))
#A subset of the table is made using the logical vector above to match the columns
merged_subset <- subset(merged_data, ,test)

#We will now aggregate the tables in order to create a tidy dataset with the average of each variable for each activity and each subject
tidydata <- aggregate(merged_subset[,4:82], list(subject = merged_subset$subject, activity_description = merged_subset$activity_description), mean)
write.table(tidydata, "tidy_dataset.txt")