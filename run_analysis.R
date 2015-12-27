library(plyr)

# Read in the data
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

testX <- read.table("test/X_test.txt")
testY <- read.table("test/y_test.txt")
testSubject <- read.table("test/subject_test.txt")

trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/y_train.txt")
trainSubject <- read.table("train/subject_train.txt")

# Merge the training and test sets to create one data set
mergedX <- rbind(trainX, testX)
mergedY <- rbind(trainY, testY)
mergedSubject <- rbind(trainSubject, testSubject)

# Extract only the measurements on the mean and standard deviation for each measurement
featureNames <- features[,2]
meanAndStd <- grep("mean\\(\\)|std\\(\\)", featureNames)
mergedX <- mergedX[, meanAndStd]
names(mergedX) <- features[meanAndStd, 2]

# Use descriptive activity names to name the activities in the data set
mergedY[, 1] <- activities[mergedY[, 1], 2]
names(mergedY) <- "Activity"

# Appropriately label the data set with descriptive variable names
names(mergedSubject) <- "Subject"
completeData <- cbind(mergedX, mergedY, mergedSubject)

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.
averageData <- ddply(completeData, .(Subject, Activity), numcolwise(mean))

write.table(averageData, file = "tidyData.txt", row.name=FALSE)
