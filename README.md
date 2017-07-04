# Introduction
One of the most exciting areas in all of data science right now is wearable computing - see for example [this article]( http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/). Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]
Here are the data for the project:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]
# Files Description
run_analysis.r = R script to read and prepare data collected by UCI from the accelerometers from the Samsung Galaxy S smartphone
Course 3 Master.txt = Training and test data collected by UCI from the accelerometers of Samsung Galaxy S smartphones containing only the measurements on the mean and standard deviation for each measurement
Course 3 Activity.txt = Data set with the average of each variable for each activity from the data collected by UCI from the accelerometers of Samsung Galaxy S smartphones
Course 3 Subject.txt = Data set with the average of each variable for each activity from the data collected by UCI from the accelerometers of Samsung Galaxy S smartphones
# Reading the Files in R
You can read the files in R using this command.
data <- read.table(file_path, header = TRUE)
