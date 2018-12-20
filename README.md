`run_analysis.R` does the following steps in order to create a clean and tidy data set (`tidy.txt`) for further analysis. 

1. Merges training and test data set using rbind function.

2. Uses `features.txt` file to as the column names of merged data set. 

3. Extracts only mean and standard deviation for each measurement based on their column name, with grepl function.

4. Merges subject id and activity label data set for training and test data set respectively, using cbind. After that, merges those data into one labeling file, using rbind. Uses descriptive column name for each variable: subject id and activity.

5. Update the activity variable with a descriptive values using the `activity_labels.txt` file. 

6. Finally, create a new datas et with the average of each variable  for each activity (6 activitiesin total) and each subject (30 subjects in total), using ddply function. This data set should have 180 observations in total.

7. Make a `tidy.txt` using write.table function from step 6. 

NB: For the code to run successfully, the unzipped raw data should be in the same folder as R file without modifying the name or directories of files. 
