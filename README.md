# coursera3_4wk
Coursera: Getting and Cleaning Data Course Project (4th week)

I create one R script called run_analysis.R as follows.

1.Setting library
 I set "dplyr" and "data.table" library.
 
2.Data import
 I put "UCI HAR Dataset" folder under my working directory. Using "read.table" command, I imported train data(X_train, y_train, subject_train) and test data(X_test, y_test, subject_test)
 
3.Label import
 I imported "features.txt" as features and "activity_labels.txt" as activity_labels.
 
4.Putting labels to each columns of X_train, X_test, subject_train and subject_test
 Using "names()" command, I put "features" variable to the X_train and X_test columns' names. In the same way, I put "Subject_ID" to subject_train and subject_test columns' names.
 
5.Adding activity levels to y_train and y_test
 I add descriptive activity names based on the coresponding activity label number. 
 
6.Putting labels to each columns of y_train and y_test
 I put descriptive variable names as "Activity_num" and "Activity_label", using "names()" command.
 
7.Binding rows of (X_train and X_test), (y_train and y_test), and (subject_train and subject_test)
 Using "rbind()" command, I bound rows between X_train and X_test. In the same way, I bound between y_train and y_test, and between subject_train adn subject_test. Bound dataset are named as "X_data", "y_data" and "subject_data"
 
8.Binding columns of subject_data, X_data and y_data
 Using "cbind()" command, I bound colomns among subject_data, X_data and y_data. I created merged_data.
 
9.Extracting only the measurements which contain the meen and std
 Using "grep" command, I selected "Subject_ID", "Activity_label", and columns that contain "mean" or "std". I created extracted_data.
 
10.Calculating average of each variable
 Using "group_by" and "sumarize_each" commands, I calculated averages of each variable for each activit and each subject.
 
11.Writing a tidy data set
 Using "write.table" command, I created a text file called "tidy_dataset.txt" from "tidy_dataset" data frame.



