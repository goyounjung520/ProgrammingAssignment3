# Code Book

This code book describes the data, variables, and transformations performed to create the tidy data set.

## Data Source
The data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Transformations
1. **Merging**: The training and test sets were merged to create one data set (`x_data`, `y_data`, `subject_data`).
2. **Extraction**: Only the measurements on the mean and standard deviation were kept using `grep`.
3. **Naming**: Numeric activity labels were replaced with descriptive names (e.g., WALKING, SITTING).
4. **Labeling**: Variable names were updated to be more descriptive (e.g., `t` became `Time`, `Acc` became `Accelerometer`).
5. **Summarizing**: A final tidy data set was created with the average of each variable for each activity and each subject.

## Variables
* `subject`: The ID of the test subject (1-30).
* `activity`: The type of activity performed (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
* `TimeBodyAccelerometerMeanX/Y/Z`: Mean of time domain body acceleration in X, Y, and Z directions.
* `TimeBodyAccelerometerStdX/Y/Z`: Standard deviation of time domain body acceleration.
* *(And other similar variables for Gyroscope and Frequency domain signals...)*
