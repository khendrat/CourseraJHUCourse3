# This function needs the reshape2 R package.

## If argument dataSetType = "", then the function will return training and test data collected by UCI from the
## accelerometers of Samsung Galaxy S smartphones containing only the measurements on the mean and standard deviation
## for each measurement.

## If argument dataSetType = "Activity", then the function will return a data set with the average of each variable for
## each activity from the data collected by UCI from the accelerometers of Samsung Galaxy S smartphones.

## If argument dataSetType = "Subject", then the function will return a data set with the average of each variable for
## each subject from the data collected by UCI from the accelerometers of Samsung Galaxy S smartphones.

run_analysis <- function(dataSetType = "")
{
  # Remember to set the appropriate working directory.

  # Read all the data and assign them to temporary R objects for later use.
  features <- read.table("./UCI HAR Dataset/features.txt")
  X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
  y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
  X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
  y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

  # Find column names with "mean" and "std" in their names.
  featuresMean <- features[grepl("mean", features$V2), ]
  featuresStD <- features[grepl("std", features$V2), ]
  columnNames <- c(as.vector(featuresMean$V2), as.vector(featuresStD$V2))

  # Extract only the measurements on the mean and standard deviation for each measurement (by selecting columns with
  # "mean" and "std" in their names).
  X_train <- X_train[, c(featuresMean$V1, featuresStD$V1)]
  X_test <- X_test[, c(featuresMean$V1, featuresStD$V1)]
  colnames(X_train) <- columnNames
  colnames(X_test) <- columnNames

  # Merge the test and training data sets.
  mergedDF <- rbind(X_train, X_test)
  
  # Translate the y data sets into descriptive activity names.
  y <- rbind(y_train, y_test)
  Activity <- sapply(y$V1, switch, "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
  subject <- rbind(subject_train, subject_test)
  colnames(subject) <- c("Subject")
  
  # Merge X and y data sets for each of the test and training data set.
  mergedDF <- cbind(mergedDF, Activity, subject)

  # Create other data sets summarizing the average of each variable for each activity and each subject.
  meltedDF <- melt(mergedDF, id = c("Activity", "Subject"), measure.vars = columnNames)
  if (dataSetType == "Activity")
  {
    activityDF <- dcast(meltedDF, Activity ~ variable, mean)
  }
  else if (dataSetType == "Subject")
  {
    subjectDF <- dcast(meltedDF, Subject ~ variable, mean)
  }
  else
  {
    mergedDF
  }
}