# Introduction
This repository is for Getting and Cleaning Data course project from Coursera. 

# Raw Data
This project uses data set on wearable computing. 
The raw data that are used for the project can be downloaded here. 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description on the raw data set are available here. 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Analysis and Goal
Running `run_analysis.R` on R will yield a clean and tidy data set (`tidy.txt`) for further analysis. Detailed explanation on `run_analysis.R` file can be found in `README.md` file.

# Variables for tidy.txt
subjectid: subject identifier, range from 1 to 30
activity: name of activities that each subject performed. this includes 6 different activities (walking, walking_upstairs, walking_downstairs, sitting, standing, laying)

All other variables are measurements 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50HZ. More information can be found in the link above on the raw data set.
