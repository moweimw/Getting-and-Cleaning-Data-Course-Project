## Getting and Cleaning Data Course Project
## Author: Wei Mo

## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Load dplyr package
library(dplyr)

## Download the dataset and put the file in the ‘data’ folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")

## Unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

## Get the list of the files
path_files <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_files, recursive=TRUE)
files

## Assign data and set names to the variables
features <- read.table(file.path(path_files, "features.txt"), col.names = c("n","functions"))
activities <- read.table(file.path(path_files, "activity_labels.txt"), col.names = c("code", "activity"))
y_test  <- read.table(file.path(path_files, "test" , "y_test.txt" ), col.names = "code")
y_train <- read.table(file.path(path_files, "train", "y_train.txt"), col.names = "code")
subject_test <- read.table(file.path(path_files, "test" , "subject_test.txt"), col.names = "subject")
subject_train <- read.table(file.path(path_files, "train", "subject_train.txt"), col.names = "subject")
X_test  <- read.table(file.path(path_files, "test" , "X_test.txt" ), col.names = features$functions)
X_train <- read.table(file.path(path_files, "train", "X_train.txt"), col.names =  features$functions)

## Check the properties of the above variables
str(y_test)
head(y_test)
str(y_train)
head(y_train)
str(subject_test)
head(subject_test)
str(subject_train)
head(subject_train)
str(X_test)
head(X_test)
str(X_train)
head(X_train)

## Step 1: Merge the training and the test sets to create one data set
X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)
data_merged <- cbind(subject, y, X)

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
data <- data_merged %>% select(subject, code, contains("mean"), contains("std"))

## Step 3: Uses descriptive activity names to name the activities in the data set
data$code <- activities[data$code, 2]

## Step 4: Appropriately labels the data set with descriptive variable names.
names(data)[2] = "activity"
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Frequency", names(data))
names(data)<-gsub("tBody", "TimeBody", names(data))

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- data %>%
     group_by(subject, activity) %>%
     summarize_all(funs(mean))
write.table(tidydata, "tidydata.txt", row.name=FALSE)
## validate
tidydata <- read.table("tidydata.txt")
View(tidydata)


