The data described below is contained in the "data_set_mean_values.txt" file.
The data was produced by the program "run_analysis.R" in R version 3.1.1 (2014-07-10) -- "Sock it to Me".
The data described below includes mean values calculated from select raw measurements taken from:

Human Activity Recognition Using Smartphones Dataset, Version 1.0.

More information about the raw data set can be found at:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory.
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws  


Variable Name: activity_name.
Description: physical activities that people engaged in while wearing a smartphone.
Class: character.
6 Levels: walking, walkingUpStairs, walkingDownStairs, sitting, standing, laying.


Variable Name: subject_id.
Description: identification numbers for 30 volunteers.
Class: integer.
30 Levels: 1 through 30 consecutively.


Variable Name: signal.
Description: various kinematic signal captured by smartphone.
Class: character.
17 Levels: fBodyAcc, fBodyAccJerk, fBodyAccMag, fBodyBodyAccJerkMag, 
fBodyBodyGyroJerkMag,fBodyBodyGyroMag, fBodyGyro, tBodyAcc, tBodyAccJerk, 
tBodyAccJerkMag, tBodyAccMag,tBodyGyro, tBodyGyroJerk, tBodyGyroJerkMag, 
tBodyGyroMag, tGravityAcc, tGravityAccMag.  


Variable Name: statistic.
Description: statistics that were measured from the signals (i.e., the mean and standard deviation).
Class: character.
2 Levels: mean, std.


Variable Name: dimension.
Description: indicates 3-axial signals for select signals.  
Class: character.
3 Levels: x, y, z.


Variable Name: data_set_id.
Description: indicates whether observation is from the training or test data sets.
Class: character.
2 Levels: train, test.


Variable Name: mean_value.
Description: the mean value calculated for a given subject across observations for a given 
activity, signal, statistic, and dimension if applicable. 
Class: numeric.
Levels: continuous. 
 