# Getting-and-Cleaning-Data-Course-Project
This is the course project for the Getting and Cleaning Data Coursera course.
The included R script, run_analysis.R, conducts the following:
Download the dataset and put the file in the ‘data’ folder if it does not already exist in the working directory.
Unzip the file.
Get the list of the files.
Assign data and set names to the variables.
Check the properties of the above variables
Merge the training and the test sets of X, y and subject to create one dataset "data_merged".
Extracts only the measurements on the mean (mean) and standard deviation (std) for each measurement to a new dataset "data".
Uses descriptive activity names to name the activities in "data"
Modify the activities (column names) in "data" to descriptive activity names (Acc" to "Accelerometer", "Gyro" to "Gyroscope","BodyBody" to "Body","Mag" to "Magnitude", "^t" to "Time", "^f" to "Frequency", and "tBody" to "TimeBody")  
From the data set "data", creates a second, independent tidy data set with the average of each variable for each activity and each subject.
The result is shown in the file tidydata.txt.
