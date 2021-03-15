# Getting-and-Cleaning-Data-Course-Project

This is the course project for the Getting and Cleaning Data Coursera course.
The included R script, run_analysis.R, conducts the following:
1. Download the dataset and put the file in the ‘data’ folder if it does not already exist in the working directory.
2. Unzip the file.
3. Get the list of the files.
4. Assign data and set names to the variables.
5. Check the properties of the above variables
6. Merge the training and the test sets of X, y and subject to create one dataset "data_merged".
7. Extracts only the measurements on the mean (mean) and standard deviation (std) for each measurement to a new dataset "data".
8. Uses descriptive activity names to name the activities in "data"
9. Modify the activities (column names) in "data" to descriptive activity names (Acc" to "Accelerometer", "Gyro" to "Gyroscope","BodyBody" to "Body","Mag" to "Magnitude", "^t" to "Time", "^f" to "Frequency", and "tBody" to "TimeBody")  
10. From the data set "data", creates a second, independent tidy data set with the average of each variable for each activity and each subject.
11. The result is shown in the file tidydata.txt.
