##Human Activity Recognition Using Smartphones Data Set 
###run_analysis.r Script

#Study Information

See the UIC machine learning archive at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones# for more information on the study and data files.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The HAR dataset includes the following files:
*'features_info.txt': Shows information about the variables used on the feature vector.
*'features.txt': List of all features.
*'activity_labels.txt': Links the class labels with their activity name.
*'X_train.txt': Training set.
*'y_train.txt': Training labels.
*'X_test.txt': Test set.
*'y_test.txt': Test labels.
*'subject_train.txt': Subject who performed the activity for each window sample. 
*'subject_test.txt': Subject who performed the activity for each window sample.

Notes: additional data files are available but were not used in this analysis

#R script

The R script is annotated to describe each processing step. These include:
1. Setting the working directory
2. Loading relevant R libraries used in processing
3. Downloading HAR data files from the UIC machine learning archive
4. Unzipping HAR data files
5. Reading lookup files ('features.txt', 'activity_labels.txt') into R
6. Reading training data files ('subject_train.txt', 'y_train.txt', 'X_train.txt') into R and renaming variables
7. Combining training data files 
8. Reading test data files ('subject_test.txt', 'y_test.txt', 'X_test.txt') into R and renaming variables
9. Combining test data 
10. Merging training and test data 
11. Attaching activity lables to activity codes 
12. Subsetting the dataset to including subject id, activity, and mean/standard deviation variables for each measurement
13. Renaming variables to human_readable format
14. Sorting the data frame by subject id and activity
15. Calculating the average of the mean and standard deviation variables for each subject/activitiy pair
16. Creating the final 'run_analysis_tidy_dataset.txt' file

#Tidy Dataset

The final dataset contains the following variables:
"subjectid"                "activity"                
"tbodyaccmagstd"           "tgravityaccmagstd"       
"tbodyaccjerkmagstd"       "tbodygyromagstd"         
"tbodygyrojerkmagstd"      "fbodyaccmagstd"          
"fbodybodyaccjerkmagstd"   "fbodybodygyromagstd"     
"fbodybodygyrojerkmagstd"  "tbodyaccmagmean"         
"tgravityaccmagmean"       "tbodyaccjerkmagmean"     
"tbodygyromagmean"         "tbodygyrojerkmagmean"    
"fbodyaccmagmean"          "fbodybodyaccjerkmagmean" 
"fbodybodygyromagmean"     "fbodybodygyrojerkmagmean"

The dataset includes 1 observation (row) for each subject (numbered 1-30) and activity (walking, walking upstairs, walking downstairs, sitting, standing, and lying down) pair (6 observations for each subject).

All other variables (begining with tbody... or fbody...) are the average mean or standard deviation (std) for the measurement. (Multiple readings were for each type of measurement were included in the original dataset.)







