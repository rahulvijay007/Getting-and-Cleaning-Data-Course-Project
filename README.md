# 📊 Human Activity Recognition Data Cleaning

## 📖 Overview
This project demonstrates how to collect, clean, and prepare data for analysis using R.  
The dataset comes from the accelerometers of the Samsung Galaxy S smartphone, part of the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  

The goal is to transform raw sensor data into a tidy dataset suitable for analysis, with clearly labeled variables and summarized measurements.

---

## ✨ Project Tasks
The main steps performed in this project are:

1. Merge training and test datasets into a single dataset.  
2. Extract only measurements on the mean and standard deviation for each variable.  
3. Assign descriptive activity names.  
4. Label the dataset with descriptive variable names.  
5. Create a tidy dataset with the average of each variable for each activity and subject.

---

## 📂 Repository Contents

- `run_analysis.R` – R script performing the full data cleaning and transformation workflow.  
- `CodeBook.md` – Description of the dataset, variables, and transformations applied.  
- `tidyData.txt` – The resulting tidy dataset produced by the script.  
- `README.md` – This file, explaining the project structure and workflow.

---

## 📥 Input Data
The raw dataset is available here:  
[Human Activity Recognition Using Smartphones Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data contains measurements of human activities (walking, sitting, standing, etc.) using smartphone accelerometers.

---

## 🛠️ Script Workflow: `run_analysis.R`

1. **Download and Unzip Data**  
   - Downloads the dataset and extracts files into the working directory.  

2. **Load Activity Labels and Features**  
   - Reads `activity_labels.txt` for descriptive activity names.  
   - Reads `features.txt` to identify variables and select mean/std measurements.  

3. **Filter Mean and Standard Deviation Variables**  
   - Extracts only relevant measurements and renames them with descriptive names.  

4. **Load Training and Test Data**  
   - Reads `X_train.txt`/`X_test.txt`, adding activity (`y_train.txt`/`y_test.txt`) and subject (`subject_train.txt`/`subject_test.txt`) columns.  

5. **Merge Training and Test Data**  
   - Combines both datasets into a single unified dataset.  

6. **Label Activities and Subjects**  
   - Applies descriptive activity names and converts subjects into factors.  

7. **Reshape and Summarize Data**  
   - Melts data into long format and computes the average of each variable for each activity and subject.  

8. **Write Tidy Dataset**  
   - Exports the cleaned, summarized dataset as `tidyData.txt`.

---

## 🚀 How to Run

1. Ensure R is installed with the following packages: `data.table`, `reshape2`, `gsubfn`.  
2. Download and unzip the dataset (see Input Data section).  
3. Place `run_analysis.R` in your working directory.  
4. Run the script in R:

```r
source("run_analysis.R")
