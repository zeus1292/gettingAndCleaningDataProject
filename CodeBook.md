Introduction
The script run_analysis.R performs the 5 steps as described in the course project's definition.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Variables
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.
x_data, y_data and subject_data merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
A similar approach is taken with activity names through the activities variable.
finalData merges x_data, y_data and subject_data in a big dataset.
Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans().
