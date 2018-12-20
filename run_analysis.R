#download plyr library
library(plyr)

#setting a local directory where you can find downloaded, unzipped files
setwd("C:/ProgrammingProjects/Coursera/Course 3/week4/UCI HAR Dataset")

## 1. Merge the training and test sets to create one data set
train <- read.table("./train/X_train.txt")
test <- read.table("./test/X_test.txt") 

merge <- rbind(train, test)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
#using features file for subsetting mean and standard deviation
features <- read.table("./features.txt")
new_features <- transpose(features)
new_features <- new_features[2, ]

#setting features as colum names of data
data <- setNames(merge, new_features)

#getting only mean() and std() data using grepl
data <- data[grepl("mean()|std()", colnames(data))]
data <- data[!grepl("meanFreq()", colnames(data))]

## 3. Use descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.
#opening activity & subject label data, and binding it together first
train_subject <- read.table("./train/subject_train.txt")
train_activity <- read.table("./train/y_train.txt") 

train_labels <- cbind(train_subject, train_activity)

test_subject <- read.table("./test/subject_test.txt")
test_activity <- read.table("./test/y_test.txt") 
test_labels <- cbind(test_subject, test_activity)

data_labels <- rbind(train_labels, test_labels)

#naming labels descriptively before merging it with the dataset
names(data_labels) <- c("subjectid", "activity")

#merge the labels with the dataset
data <- cbind(data_labels, data)

#opening the activity label data
activity_labels <- read.table("./activity_labels.txt")

#using descriptive activity names to name the activities in the dataset
data[, 2] <- activity_labels[data[, 2], 2]

#5. From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.
mean_data <- ddply(data, .(subjectid, activity), function(x) colMeans(x[, 3:68]))
write.table(mean_data, "tidy.txt", row.names = FALSE)