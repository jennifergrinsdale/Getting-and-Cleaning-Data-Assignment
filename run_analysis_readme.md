
## Human Activity Recognition Using Smartphones Data Set 
### Getting and Cleaning Data Repository Files

This repository contains the following files:

run_analysis_readme.md - readme file for the repository
run_analysis.r - r script for creating the "r analysis tidy dataset.csv" file
run_analysis_codebook.md - codebook explaining the data files and r script for processing these files
run analysis tidy dataset.csv - final tidy dataset

The run_analysis r script in this repository combines training and test data sets from the Human Activity Recognition (HAR) Using Smartphones study. Study information and datasets are available from the UIC machine learning archive at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#.
(Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.)

The purpose of the run_analysis r script is to:
* Merge the HAR training and the test sets to create one data set
* For each subject and activity, extract the variables for the mean and standard deviation for each measurement
* Rename variables to a human-readable, descriptive format 
* Analyze the data to calculate the average of each variable (mean and standard deviation) for each activity and each subject
* Create a tidy dataset for further analysis




