# Getting-and-Cleaning-Data-Course-Project

This project demonstrates the ability to collect, clean, and prepare data for analysis. The data used in this project was collected from the accelerometers of the Samsung Galaxy S smartphone, as part of the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The goal of this project is to transform raw data into a tidy dataset that can be used for future analysis. This `README.md` explains the structure of the project, the R script, and the steps followed to achieve the goal.

---

## Project Overview

The project performs the following key tasks:
1. Merges the training and test datasets to create one comprehensive dataset.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to label the activities in the dataset.
4. Appropriately labels the dataset with descriptive variable names.
5. Creates an independent tidy dataset with the average of each variable for each activity and subject.

---

## Files in the Repository

- `run_analysis.R`: The R script that performs the data cleaning and transformation tasks.
- `CodeBook.md`: A document describing the variables in the dataset, the data, and the transformations applied.
- `tidyData.txt`: The resulting tidy dataset created by the `run_analysis.R` script.
- `README.md`: This file, which explains the purpose, structure, and execution of the project.

---

## Input Data

The raw dataset is sourced from the following URL:  
[Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The dataset contains measurements of human activity using accelerometers in a smartphone, including activities such as walking, sitting, and standing.

---

## Script Details: `run_analysis.R`

### Steps Performed by the Script:

1. Download and Unzip Data:
   - The script downloads the dataset from the provided URL and unzips it into the working directory.

2. Load Activity Labels and Features:
   - Reads `activity_labels.txt` for descriptive activity names.
   - Reads `features.txt` to identify measurements and filter those related to mean and standard deviation.

3. Filter Mean and Standard Deviation Variables:
   - Extracts only the measurements related to mean and standard deviation.
   - Renames these variables with descriptive names.

4. Load Training and Test Data:
   - Reads the training (`X_train.txt`) and test (`X_test.txt`) datasets.
   - Adds activity (`y_train.txt`, `y_test.txt`) and subject (`subject_train.txt`, `subject_test.txt`) columns.

5. Merge Training and Test Data:
   - Combines the training and test datasets into one unified dataset.

6. Label Activities and Subjects:
   - Assigns descriptive activity names and converts subject identifiers into factors.

7. Reshape and Summarize Data:
   - Melts the data to a long format and calculates the average of each variable for each activity and subject.

8. Write Tidy Dataset:
   - Exports the tidy dataset as `tidyData.txt`.

---

## How to Run the Script

1. Ensure you have R and the required packages (`data.table`, `reshape2`, `gsubfn`) installed.
2. Download the raw dataset using the link provided above.
3. Place the `run_analysis.R` script in your working directory.
4. Run the script in R using the command:

   ```R
   source("run_analysis.R")
