#Setting working directory
#setwd("/home/tommat/R/coursera3_4wk")

#library settings
library(dplyr)
library(data.table)

#Data imports
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#labels imports
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

#labels to each columns of X_train, X_test, subject_train and subject_test
names(X_train) = features
names(X_test) = features
names(subject_train) = c("Subject_ID")
names(subject_test) = c("Subject_ID")

#adding activity levels to y_train and y_test
y_train[,2] = activity_labels[y_train[,1]]
y_test[,2] = activity_labels[y_test[,1]]

#labels to each columns of y_train and y_test
names(y_train) = c("Activity_num", "Activity_label")
names(y_test) = c("Activity_num", "Activity_label")

#row bindings of (X_train and X_test), (y_train and y_test), and (subject_train and subject_test)
X_data <- rbind(X_train, X_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

#column bindings of subject_data, X_data and y_data
merged_data <- cbind(y_data, subject_data, X_data)

#extract only the measurements which contain the meen and std. 
extracted_data <- merged_data[,grep("Subject_ID|Activity_label|mean|std", x=colnames(merged_data))]

#calculating average of each variable
tidy_dataset <- extracted_data %>% group_by(Activity_label, Subject_ID) %>% summarize_each(list(mean))

#Making tidy dataset
write.table(tidy_dataset, file = "./UCI HAR Dataset/tidy_dataset.txt", row.names = FALSE, col.names = TRUE)
