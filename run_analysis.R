#Read raw data into R
act_label <- read.table("activity_labels.txt", header = FALSE, sep = "")
features <- read.table("features.txt", header = FALSE, sep = "")
subject_test <- read.table ("~/Downloads/UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")
activity_test <- read.table("~/Downloads/UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
data_test <- read.table("~/Downloads/UCI HAR Dataset/test/x_test.txt", header = FALSE, sep = "")
data_train <- read.table("~/Downloads/UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
activity_train <- read.table("~/Downloads/UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
subject_train <- read.table ("~/Downloads/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
#Building up the data set by merging train and test data, as well as subject and activity dimensions.
DS_data <- rbind(data_test, data_train)
DS_activity <- rbind(activity_test, activity_train)
DS_subject <- rbind(subject_test, subject_train)
DS_as <- cbind(DS_subject, DS_activity)
names(DS_data) <- as.character(features$V2)
#Extracts only the measurements on the mean and standard deviation for each measurement.
DS_data_mean_std <- subset(DS_data, select = grep("-mean()|-std()", names(DS_data)))
DS_data_complete <- cbind(DS_as, DS_data_mean_std)
#Applies descriptive activity names to name the activities in the data set
names(act_label) <- c("activity", "activity_label")
DS_data_complete <- left_join(DS_data_complete, act_label, by = activity)
DS_data_complete$activity <- DS_data_complete$activity_label
DS_data_complete <- DS_data_complete[,-c(ncol(DS_data_complete))]
#Lables dataset with descriptive variable names.
names(DS_data_complete) <- gsub("Gyro", "Gyroscope", names(DS_data_complete))
names(DS_data_complete) <- gsub("Acc", "Accelerometer", names(DS_data_complete))
names(DS_data_complete) <- gsub("^t", "time", names(DS_data_complete))
names(DS_data_complete) <- gsub("^f", "frequency", names(DS_data_complete))
#Creates a new, independent tidy data set with the average of each variable for each activity and each subject.
library(reshape2)
DS_melt <- melt(DS_data_complete, id = c("subject", "activity"), measure.vars = c)
DS_averages <- dcast(DS_melt, subject + activity ~ variable,mean)
#Writes two datasets into csv files.
write.csv(DS_comp_test_2, "DS_data_complete.csv")
write.csv(DS_averages, "DS_averages.csv")