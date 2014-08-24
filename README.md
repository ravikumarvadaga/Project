Project
=======

Introduction

This Project is part of theh Coursework for "Getting & Cleaning Data" part of the Data Science specialization. This Project uses the data set originally recored as part of the experiments that  been carried out by with a group of 30 volunteers within an age bracket of 19-48 years. The data linked is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data used for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Assignment Steps 

Post interpreting the data this assignment  involved create one R script called run_analysis.R that does the following steps/susteps. 

1.Merges the training and the test sets to create one data set.
  
  1.1 loading the follwing  files from the common folder (/.project)
  
        subject_test.txt    - maps the subjects and observation id's for test data set
        subject_train.txt   - maps the subjects and observation id's for training data set
        activity_labels.txt - maps the ativityid's with activity labels
        features.txt        - this provides the list of observation variables in the order that 
        y_test.txt          - maps the activity id's with obervation id's in the test data set
        y_train.txt         - maps the activity id's with obervation id's in the train data set
        X_test.txt          - maps the observation id's with the Observations for test dataset
        X_train.txt         -maps the observation id's with the Observations for train dataset
    
  1.2 Renaming the X_test and X_train datasets Column headers with the features dataset value
  
  1.3 Changing the column names of the activity dataset (y_test,y_train) and subject dataset(subject_test)
  
  1.4 Column bind the ActivitiesID and SubjectID to observations dataset X_test ,X_train
  
  1.5 Row bind the test and training data set  to Create a total data set of test and train
    


2.Extracts only the measurements on the mean and standard deviation for each measurement. 

  2.1 Select only those columns which have mean() or std() or activityid or subjectid (added earlier)
  
  
3.Uses descriptive activity names to name the activities in the data set


4.Appropriately labels the data set with descriptive variable names. 

  4.1 lowercase all the variable names
  4.2 remove underscores(_) 
  4.3 remove ()
  4.4 remove typo bodybody with body in some of the variable names

5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject
  **  ensure reshape2 package is installed for melt and dcast function to work

Submission Needs

   The submissiion requires 

      upload the tidy data set 
      submitting a github link to repo  cosisting of
        run_analysis.R  "providing the R code "
        Code Book to interpret tidy data set
        readme file to interpret the over project

Grading
      this Project carries 40% overall weightage
      this will be graded by Peers 
      
