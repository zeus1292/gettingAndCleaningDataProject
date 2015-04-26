library(plyr)

# Merge the training and test sets to create one data set

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# create 'x' data set
x_data <- rbind(x_train, x_test)

# create 'y' data set
y_data <- rbind(y_train, y_test)

# create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
meanStdFeatures <- grep("-(mean|std)\\(\\)", features[, 2])

x_data <- x_data[, mean_and_std_features]

# correct the column names
names(x_data) <- features[mean_and_std_features, 2]

# Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"


# Appropriately label the data set with descriptive variable names

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
finalData <- cbind(x_data, y_data, subject_data)


# Create a second, independent tidy data set with the average of each variable
# for each activity and each subject
# Last two columns omitted
averages_data <- ddply(finalData, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)