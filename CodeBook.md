# Course 3 Master.txt

## Data Sources

* 'features.txt': List of all features (column names for the X data sets)
* 'train/X_train.txt': Training set
* 'train/y_train.txt': Training activities
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample; its range is from 1 to 30 
* 'test/X_test.txt': Test set
* 'test/y_test.txt': Test labels
* 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample; its range is from 1 to 30

## Result (Tidy Data)

Merged training and test data containing only the measurements on the mean and standard deviation for each measurement.

## Steps to Create Result

1. Read data using read.table function into data frames.
2. Find column names with "mean" and "std" in their names using grepl function.
3. For the X data sets Extract only the measurements on the mean and standard deviation for each measurement (by selecting columns with "mean" and "std" in their names) using [] operator to subset the data frame.
4. For the X and subject data sets, label the data set with descriptive variable names using colnames function.
5. Merge the test and training data sets using the rbind function.
6. Translate the y data sets into descriptive activity names using the switch and sapply functions and values from 'activity_labels.txt'.
7. Merge X and y data sets with activity and subject for each of the test and training data set using the cbind function.

# Course 3 Average.txt

## Data Sources

* Course 3 Master.txt

## Result (Tidy Data)

Data set with the average of each variable for each activity and each subject from the data set in Course 3 Master.txt.

## Steps to Create Result

1. Create a molten data frame (narrow form) from the data set in Course 3 Master.txt using the melt function.
2. Summarize the average of each variable for each activity and each subject by applying the mean function within the dcast function.
