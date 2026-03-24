# Getting and Cleaning Data Course Project

This repository contains the R script and documentation for the Coursera "Getting and Cleaning Data" course project. The purpose of this project is to demonstrate the ability to collect and clean a tidy data set.

## Files in this Repository
* `run_analysis.R`: The R script used to process the raw data and produce a tidy data set.
* `CodeBook.md`: A code book that describes the variables, the data, and any transformations performed to clean up the data.
* `tidy_data.txt`: The final tidy data set (the output of the script).

## How to Run the Script
1. Download and unzip the data from: [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. Set your R working directory to the `UCI HAR Dataset` folder.
3. Place `run_analysis.R` in that same folder.
4. Run the script using the command: `source("run_analysis.R")`.
5. The script will generate a file named `tidy_data.txt` in your working directory.
