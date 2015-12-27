# Code Book

## Variables
* features : Table from the features.txt file
* activities :  Table from the activity_labels.txt file
* testX :  Table from the X_test.txt file
* testY :  Table from the Y_test.txt file
* testSubject :  Table from the subject_test.txt file
* trainX :  Table from the X_train.txt file
* trainY :  Table from the Y_train.txt file
* trainSubject :  Table from the subject_train.txt file
* mergedX : Holds row binding of trainX and testX
* mergedY : Holds row binding of trainY and testY
* mergedSubject : Holds row binding of trainSubject and testSubject
* featureNames : Contains only the relavant name data needed from the features table
* meanAndStd : The featureNames that have mean() or std() in them
* averageData : The average of each variable for activity and subject

## Work Performed
* Read the raw data
* Extract only the mean and standard deviation features
* Merge all the data together
* Tidy up the data by providing better names for the variables
* Get the means for the data
* Write out the tidy data to a txt file called "tidyData.txt"
