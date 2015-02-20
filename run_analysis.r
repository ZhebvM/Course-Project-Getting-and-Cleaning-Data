# This file contains the code for the course project in "Getting and Cleaning Data"
# February 2015

# Set working directory here 

setwd{"..."}

# Step 1: Read all text files into R 

features <- read.table("features.txt") # lists of all features 
labels_file <- read.table("activity_labels.txt") # only 6 rows indicates activities

train_x <- read.table("train/X_train.txt")
train_y <- read.table("train/y_train.txt") # labels


test_x <- read.table("test/X_test.txt"
test_y <- read.table("test/y_test.txt") # labels for test 

train_sub <- read.table("train/subject_train.txt") # subjects train
test_sub <- read.table("test/subject_test.txt") # subjects test 

# Add labels + subjects + features for train and test 

train <- cbind(train_sub$V1, train_y$V1, train_x)
test <- cbind(test_sub$V1, test_y$V1, test_x )

# Rename variables before appending 

names(train)[1] <- "SubjectID"
names(test)[1] <- "SubjectID"

names(train)[2] <- "Activity"
names(test)[2] <- "Activity"

# Append the two files 

final <- rbind(train, test)

# Label each activity using the info from the labels file 

final$Activity <- factor(final$Activity, labels = labels_file$V2)

# Label each feature using the names from the features file 

names(final)[3:563] <- as.character(features$V2)

# Extract features recording only mean and sd

means <- grep("mean",levels(features$V2),value=T)
sds <- grep("std",levels(features$V2),value=T)

# Subset only columns with means or sds 

myvars <- c(means, sds)
newdata <- final[myvars]

# Prepare the final data set 

final_data <- cbind(final$SubjectID, final$Activity, newdata)
names(final_data)[1:2] <- c("SubjectID", "Activity")

# Prepare the data set with the average of each variable for each activity and each subject

average_data <- aggregate(final_data[,3:dim(final_data)[2]], by=list(final_data$SubjectID, final_data$Activity), FUN=mean)
names(average_data)[1:2] <- c("SubjectID", "Activity")

# Write the data set as a table and prepare for submitting 

write.table(average_data, "average_data.txt", row.names=FALSE, col.names=TRUE)

#----------------------------------------------------------------------------------------------
# Test how the file reads when open
#test <- read.table("average_data.txt", header=TRUE)
#head(test)

