# Load necessary libraries
if (!require("pacman")) {
    install.packages("pacman")
}
pacman::p_load(data.table, reshape2, gsubfn)

# Define file paths and download data
workingDir <- getwd()
zipLink <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipLink, file.path(workingDir, "dataset.zip"))
unzip(zipfile = "dataset.zip")

# Load activity labels and features
activities <- fread(
    file.path(workingDir, "UCI HAR Dataset/activity_labels.txt"),
    col.names = c("code", "activity")
)

variables <- fread(
    file.path(workingDir, "UCI HAR Dataset/features.txt"),
    col.names = c("num", "name")
)

# Extract mean and standard deviation variables
selectedCols <- grep("(mean|std)\\(\\)", variables[, name])
selectedVars <- variables[selectedCols, name]
selectedVars <- gsubfn(
    "(^t|^f|Acc|Gyro|Mag|BodyBody|\\(\\))",
    list(
        "t" = "Time",
        "f" = "Frequency",
        "Acc" = "Accelerometer",
        "Gyro" = "Gyroscope",
        "Mag" = "Magnitude",
        "BodyBody" = "Body",
        "()" = ""
    ),
    selectedVars
)

# Load and prepare training data
trainData <- fread(file.path(workingDir, "UCI HAR Dataset/train/X_train.txt"))[, selectedCols, with = FALSE]
setnames(trainData, colnames(trainData), selectedVars)

trainActivity <- fread(
    file.path(workingDir, "UCI HAR Dataset/train/y_train.txt"),
    col.names = "Activity"
)
trainSubject <- fread(
    file.path(workingDir, "UCI HAR Dataset/train/subject_train.txt"),
    col.names = "SubjectID"
)

trainData <- cbind(trainActivity, trainSubject, trainData)

# Load and prepare test data
testData <- fread(file.path(workingDir, "UCI HAR Dataset/test/X_test.txt"))[, selectedCols, with = FALSE]
setnames(testData, colnames(testData), selectedVars)

testActivity <- fread(
    file.path(workingDir, "UCI HAR Dataset/test/y_test.txt"),
    col.names = "Activity"
)
testSubject <- fread(
    file.path(workingDir, "UCI HAR Dataset/test/subject_test.txt"),
    col.names = "SubjectID"
)

testData <- cbind(testActivity, testSubject, testData)

# Merge training and test datasets
combinedData <- rbind(trainData, testData)

# Assign descriptive activity names
combinedData[["Activity"]] <- factor(combinedData[, Activity],
    levels = activities[["code"]],
    labels = activities[["activity"]]
)

# Convert subject identifiers to factors
combinedData[["SubjectID"]] <- as.factor(combinedData[, SubjectID])

# Reshape the data to calculate averages
meltedData <- melt.data.table(combinedData, id = c("SubjectID", "Activity"))
finalData <- dcast(meltedData, SubjectID + Activity ~ variable, mean)

# Save the tidy dataset
fwrite(finalData, file = "finalTidyData.txt")
