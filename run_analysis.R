## Coursera - Getting and Cleaninga DATA - 031 - August 2015
## Projet: the goal is to prepare "tidy data" that can be used for later analysis
## This code is the script called "run_analysis.R" 
## Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## This project Rscript does the following

## 1 - Download and Unzip tne sourse data (data set)
filename <- "getdata_dataset.zip"

if (!file.exists(filename)){
	fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  	download.file(fileURL, filename, method="libcurl") 
	## I should use "libcurl", because my microstation is MS
}  

if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 

## 2 -  Merges the training and the test sets to create one data set
xtrain1 <- read.table("train/X_train.txt")
xtest2 <- read.table("test/X_test.txt")
X <- rbind(xtrain1, xtest2)

strain1 <- read.table("train/subject_train.txt")
stest2 <- read.table("test/subject_test.txt")
S <- rbind(strain1, stest2)

ytrain1 <- read.table("train/y_train.txt")
ytest2 <- read.table("test/y_test.txt")
Y <- rbind(ytrain1, ytest2)

## 3 - Extracts only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))


## 4 - Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

## 5 - Appropriately labels the data set with descriptive activity names.
names(S) <- "subject"
cleaned <- cbind(S, Y, X)


## 6 - Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.
uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]
row = 1
for (s in 1:numSubjects) {
for (a in 1:numActivities) {
result[row, 1] = uniqueSubjects[s]
result[row, 2] = activities[a, 2]
tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
row = row+1
}
}

## 7 - Create the "tidy data"
write.table(result, "tidy_data.txt", row.name=FALSE)