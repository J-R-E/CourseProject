setwd("C:/Coursera/Getting and Cleaning Data/week 3/Course Project/Data")

library(reshape2)
library(tidyr)
library(dplyr)

features <- read.table("features.txt") ##Reads document containing names of signal, statistic, and 
                                       ##dimension combinations.


x_train <- read.table("X_train.txt", col.names = features[,2]) ##Reads document containing various 
                                                               ##statistics for different signals for 
                                                               ##training subjects.

x_test <- read.table("X_test.txt", col.names = features[,2]) ##Reads document containing various 
                                                             ##statistics for different signals for 
                                                             ##test subjects. 


subject_train <- read.table("subject_train.txt", col.names = "subject_id") ##Reads document containing 
                                                                           ##IDs of training subjects.

subject_test <- read.table("subject_test.txt", col.names = "subject_id") ##Reads document containing IDs
                                                                         ##of test subjects.

y_train <- read.table("y_train.txt", col.names = "activity_code") ##Reads document containing activity 
                                                                  ##codes for training subjects.

y_test <- read.table("y_test.txt", col.names = "activity_code") ##Reads document containing activity 
                                                                ##codes for test subjects.


train <- data.frame(subject_train, y_train, x_train) ##Creates a single data frame for training data.

test <- data.frame(subject_test, y_test, x_test) ##Creates a single data frame for test data.


train_melted <- melt(train, id=c("subject_id","activity_code")) ##Melts "train" data set, i.e., signal, 
                                                                ##statistic, and dimension combination 
                                                                ##variables are placed in a column 
                                                                ##labeled "variable" and their values in
                                                                ##a column labeled "value". 

test_melted <- melt(test, id=c("subject_id","activity_code")) ##Melts "test" data set, i.e., signal, 
                                                              ##statistic, and dimension combination 
                                                              ##variables are placed in a column labeled
                                                              ##"variable" and their values in a column 
                                                              ##labeled "value". 


train_names_of_mean_variables_to_retain <- {unique(grep("mean.", train_melted[,3], value = TRUE, 
                                            ignore.case = FALSE, fixed = TRUE))} 
                                                              ##Creates a character vector of the names 
                                                              ##of the signal, statistic, and dimension 
                                                              ##combination variables that focus on the 
                                                              ##mean statistic, and that will be retained
                                                              ##for the training data (i.e., all 
                                                              ##variables that have "mean." in their name).

train_names_of_std_variables_to_retain <- {unique(grep("std.", train_melted[,3], value = TRUE, 
                                           ignore.case = FALSE, fixed = TRUE))} 
                                                              ##Creates a character vector of the names 
                                                              ##of the signal, statistic, and dimension 
                                                              ##combination variables that focus on the 
                                                              ##standard deviation statistic, and that 
                                                              ##will be retained for the training data 
                                                              ##(i.e., all variables that have "std." in 
                                                              ##their name).

train_names_of_variables_to_retain <- c(train_names_of_mean_variables_to_retain, train_names_of_std_variables_to_retain) 
                                                              ##Creates a character vector of the names 
                                                              ##of the signal, statistic, and dimension 
                                                              ##combination variables that focus on the 
                                                              ##mean or the standard deviation statistics,
                                                              ##and that will be retained for the 
                                                              ##training data (i.e., all variables that 
                                                              ##have "mean." or "std." in their name).

test_names_of_mean_variables_to_retain <- {unique(grep("mean.", test_melted[,3], value = TRUE, 
                                           ignore.case = FALSE, fixed = TRUE))} 
                                                              ##Creates a character vector of the names
                                                              ##of the signal, statistic, and dimension 
                                                              ##combination variables that focus on the
                                                              ##mean statistic, and that will be retained 
                                                              ##for the test data (i.e., all variables 
                                                              ##that have "mean." in their name).

test_names_of_std_variables_to_retain <- {unique(grep("std.", test_melted[,3], value = TRUE, 
                                          ignore.case = FALSE, fixed = TRUE))} 
                                                              ##Creates a character vector of the names
                                                              ##of the signal, statistic, and dimension
                                                              ##combination variables that focus on the
                                                              ##standard deviation statistic, and that 
                                                              ##will be retained for the test data (i.e.,
                                                              ##all variables that have "std." in their 
                                                              ##name).

test_names_of_variables_to_retain <- c(test_names_of_mean_variables_to_retain, test_names_of_std_variables_to_retain) 
                                                              ##Creates a character vector of the names
                                                              ##of the signal, statistic, and dimension
                                                              ##combination variables that focus on the
                                                              ##mean or the standard deviation statistics,
                                                              ##and that will be retained for the test 
                                                              ##data (i.e., all variables that have 
                                                              ##"mean." or "std." in their name).


train_melted_filter_variables <- filter(train_melted, variable %in% train_names_of_variables_to_retain) 
                                                              ##Filters (i.e., allows to pass through the
                                                              ##filter) the rows from the melted training
                                                              ##data set (i.e., "train_melted") that 
                                                              ##pertain to the signal, statistic, and 
                                                              ##dimension combination variables that 
                                                              ##focus on the mean or the standard 
                                                              ##deviation statistics, and stores them in 
                                                              ##a new data frame.  

test_melted_filter_variables <- filter(test_melted, variable %in% test_names_of_variables_to_retain) 
                                                              ##Filters (i.e., allows to pass through the
                                                              ##filter) the rows from the melted test 
                                                              ##data set (i.e., "test_melted") that 
                                                              ##pertain to the signal, statistic, and 
                                                              ##dimension combination variables that 
                                                              ##focus on the mean or the standard 
                                                              ##deviation statistics, and stores them in 
                                                              ##a new data frame.  


train_melted_filter_variables_separate <- {separate(train_melted_filter_variables, variable, 
                                           c("signal", "statistic", "dimension"))} 
                                                              ##Separates the remaining signal, statistic, 
                                                              ##and dimension combination variables into 
                                                              ##three separate variables (i.e., "signal", 
                                                              ##"statistic", and "dimension") for the 
                                                              ##training data. 

test_melted_filter_variables_separate <- {separate(test_melted_filter_variables, variable, 
                                          c("signal", "statistic", "dimension"))} 
                                                              ##Separates the remaining signal, statistic, 
                                                              ##and dimension combination variables into 
                                                              ##three separate variables (i.e., "signal", 
                                                              ##"statistic", and "dimension") for the 
                                                              ##test data. 

train_melted_filter_variables_separate_data_set_id <- {mutate(train_melted_filter_variables_separate, 
                                                       data_set_id = "train")} 
                                                              ##Adds a data set id column 
                                                              ##(i.e., "data_set_id") to the melted, 
                                                              ##filtered, and separated variables 
                                                              ##training data set.

test_melted_filter_variables_separate_data_set_id <- mutate(test_melted_filter_variables_separate, data_set_id = "test") 
                                                              ##Adds a data set id column 
                                                              ##(i.e., "data_set_id") to the melted, 
                                                              ##filtered, and separated variables test 
                                                              ##data set.


melted_filter_variables_separate_data_set_id <- {rbind(train_melted_filter_variables_separate_data_set_id,
                                                 test_melted_filter_variables_separate_data_set_id)} 
                                                              ##Merges the melted, filtered, and 
                                                              ##separated variables training and test 
                                                              ##data sets. 


grouping_structure <- {group_by(melted_filter_variables_separate_data_set_id, activity_code, subject_id,
                       signal, statistic, dimension, data_set_id)} 
                                                              ##Specifies the grouping structure to be 
                                                              ##applied in subsequent call to summarize 
                                                              ##the data set. 

data_set_mean_values <- summarise(grouping_structure, mean_value = mean(value)) 
                                                              ##Applies the grouping structure specified 
                                                              ##previously to calculate the mean value of 
                                                              ##each variable for each activity and each 
                                                              ##subject in the data set.

data_set_mean_values_data_frame <- as.data.frame(data_set_mean_values) 
                                                              ##Converts "data_set_mean_values" object to 
                                                              ##class data.frame.



activity_name <- character() ##Initializes "activity_name" character vector to be used to store 
                              ##descriptive activity names.                        

##Below for loop and if else statements create a character vector of descriptive activity names.  

for(i in 1:length(data_set_mean_values_data_frame[,1])) {
    
    if(data_set_mean_values_data_frame[i,1] == 1) {
        
        activity_name[i] <- "walking"
    
    } else if (data_set_mean_values_data_frame[i,1] == 2) {
        
        activity_name[i] <- "walkingUpStairs" 
        
    } else if (data_set_mean_values_data_frame[i,1] == 3) {
        
        activity_name[i] <- "walkingDownStairs" 
        
    } else if (data_set_mean_values_data_frame[i,1] == 4) {
        
        activity_name[i] <- "sitting" 
        
    } else if (data_set_mean_values_data_frame[i,1] == 5) {
        
        activity_name[i] <- "standing" 
        
    } else if (data_set_mean_values_data_frame[i,1] == 6) {
        
        activity_name[i] <- "laying" 
        
    }

}


data_set_mean_values_data_frame_activity <- {data.frame(activity_name, data_set_mean_values_data_frame[,2:7], 
                                             stringsAsFactors = FALSE)}
                                                              ##Creates a new data frame object called 
                                                              ##"data_set_mean_values_data_frame_activity".  
                                                              ##This object is identical to the 
                                                              ##"data_set_mean_values_data_frame" object 
                                                              ##with the exception that the "activity_code" 
                                                              ##variable is replaced by the "activity_name" 
                                                              ##variable.




