# CodeBook

This `CodeBook.md` describes the data, variables, and transformations performed in the project "Human Activity Recognition Using Smartphones - Data Cleaning Project." The goal of the project was to create a tidy dataset summarizing the average of specific variables for each activity and subject.

---

## Raw Dataset Description

The data was sourced from the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The dataset was collected from the accelerometers and gyroscopes of a Samsung Galaxy S smartphone carried by 30 subjects while performing six activities: 

1. Walking  
2. Walking Upstairs  
3. Walking Downstairs  
4. Sitting  
5. Standing  
6. Lying  

The raw data contains the following files:
- `activity_labels.txt`: Links activity labels with their names.
- `features.txt`: Contains the names of all measured variables.
- `X_train.txt` and `X_test.txt`: Datasets containing the feature measurements for the training and test sets.
- `y_train.txt` and `y_test.txt`: Activity labels for the training and test datasets.
- `subject_train.txt` and `subject_test.txt`: Subject IDs for the training and test datasets.

---

## Tidy Dataset Description

The final tidy dataset, `finalTidyData.txt`, contains the average of each selected variable for each activity and each subject. It has the following characteristics:

- Columns:
  1. `SubjectNo.`: The ID of the subject (1 to 30).
  2. `Activity`: The activity performed by the subject (e.g., "Walking," "Sitting").
  3. A set of feature variables representing the mean or standard deviation measurements of accelerometer and gyroscope data. 

---

## Variable Naming Conventions

Variable names in the tidy dataset were transformed for better readability and understanding. The following naming conventions were applied:

- Prefix:
  - `Time` represents time-domain signals (originally prefixed with `t` in `features.txt`).
  - `Frequency` represents frequency-domain signals (originally prefixed with `f` in `features.txt`).

- Suffix:
  - `Accelerometer`: Indicates measurements from the accelerometer sensor (originally `Acc` in `features.txt`).
  - `Gyroscope`: Indicates measurements from the gyroscope sensor (originally `Gyro` in `features.txt`).
  - `Magnitude`: Indicates the magnitude of a 3D signal (originally `Mag` in `features.txt`).
  
- Adjustments:
  - Parentheses `()` were removed for clarity.
  - Repeated terms (e.g., `BodyBody`) were corrected to single instances (e.g., `Body`).

Example:
- `tBodyAcc-mean()-X` → `TimeBodyAccelerometerMeanX`
- `fBodyGyro-std()-Y` → `FrequencyBodyGyroscopeStdY`

---

## Transformations Performed

1. Merging Data:
   - Combined training and test datasets (`X_train.txt` and `X_test.txt`) into one dataset.

2. Extracting Relevant Features:
   - Selected only the features containing mean (`mean()`) or standard deviation (`std()`).

3. Descriptive Activity Names:
   - Replaced activity labels (e.g., `1, 2, ...`) with descriptive activity names (e.g., `Walking`, `Sitting`).

4. Renaming Variables:
   - Applied descriptive names to feature variables based on the conventions outlined above.

5. Reshaping Data:
   - Melted the dataset into long format with `SubjectNo.`, `Activity`, `Variable`, and `Value`.
   - Casted the dataset back into wide format with averages for each variable grouped by `SubjectNo.` and `Activity`.

---

## Feature Variables

The tidy dataset contains the average of the following variables for each activity and subject:

1. TimeDomain Signals:
   - BodyAccelerometerMean (X, Y, Z)
   - BodyAccelerometerStd (X, Y, Z)
   - GravityAccelerometerMean (X, Y, Z)
   - GravityAccelerometerStd (X, Y, Z)

2. FrequencyDomain Signals:
   - BodyAccelerometerMean (X, Y, Z)
   - BodyAccelerometerStd (X, Y, Z)
   - BodyGyroscopeMean (X, Y, Z)
   - BodyGyroscopeStd (X, Y, Z)

3. Magnitude Signals:
   - BodyAccelerometerMagnitudeMean
   - BodyAccelerometerMagnitudeStd
   - GravityAccelerometerMagnitudeMean
   - GravityAccelerometerMagnitudeStd
   - BodyGyroscopeMagnitudeMean
   - BodyGyroscopeMagnitudeStd

---

## Dependencies

The `run_analysis.R` script requires the following R packages:
- `data.table`: For fast data manipulation.
- `reshape2`: For reshaping the dataset.
- `gsubfn`: For advanced string manipulation.

---

This `CodeBook.md` provides a detailed explanation of the dataset and transformations, ensuring reproducibility and clarity for further analysis.
