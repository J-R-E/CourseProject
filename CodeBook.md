* The data described below is contained in the "data_set_mean_values.txt" file.
* The data was produced by the program "run_analysis.R" in R version 3.1.1 (2014-07-10) -- "Sock it to Me".
* The data described below includes mean values calculated from select raw measurements taken from:

* Human Activity Recognition Using Smartphones Dataset, Version 1.0

* More information about the raw data set can be found at:

* Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
* Smartlab - Non Linear Complex Systems Laboratory
* DITEN - Università degli Studi di Genova.
* Via Opera Pia 11A, I-16145, Genoa, Italy.
* activityrecognition@smartlab.ws
* www.smartlab.ws  






* variable name: activity_name
* description: physical activities that people engaged in while wearing a smartphone.
* class: character
* 6 levels:
* walking
* walkingUpStairs
* walkingDownStairs
* sitting
* standing
* laying




* variable name: subject_id
* description: identification numbers for 30 volunteers.
* class: integer
* 30 levels: 1 through 30 consecutively




* variable name: signal
* description: various kinematic signal captured by smartphone.
* class: character
* 17 levels: 
* fBodyAcc 
* fBodyAccJerk 
* fBodyAccMag 
* fBodyBodyAccJerkMag 
* fBodyBodyGyroJerkMag,
* fBodyBodyGyroMag 
* fBodyGyro 
* tBodyAcc 
* tBodyAccJerk 
* tBodyAccJerkMag 
* tBodyAccMag
* tBodyGyro
* tBodyGyroJerk
* tBodyGyroJerkMag
* tBodyGyroMag
* tGravityAcc
* tGravityAccMag  




* variable name: statistic
* description: statistics that were measured from the signals (i.e., the mean and standard deviation).
* class: character
* 2 levels: mean, std




* variable name: dimension
* description: indicates 3-axial signals for select signals.  
* class: character
* 3 levels: x, y, z




* variable name: data_set_id
* description: indicates whether observation is from the training or test data sets.
* class: character
* 2 levels: train, test




* variable name: mean_value
* description: the mean value calculated for a given subject across observations for a given 
* activity, signal, statistic, and dimension if applicable. 
* class: numeric
* levels: continuous 
 