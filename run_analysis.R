## Assignment  step 1.Merges the training and the test sets to create one data set.

## substep -loading all the files from the common folder (/.project)

subject_test <- read.table("./project/subject_test.txt")
subject_train <- read.table("./project/subject_train.txt")
activity_labels <- read.table("./project/activity_labels.txt")
features<-read.table("./project/features.txt")
y_test<-read.table("./project/y_test.txt")
y_train<-read.table("./project/y_train.txt")
X_test<-read.table("./project/X_test.txt")
X_train<-read.table("./project/X_train.txt")

## substep - renaming the X_test and X_train datasets Column headers with the features dataset value

colnames(X_test)<-features[,2]
colnames(X_train)<-features[,2]

## substep -change the column names of the activity dataset (y_test,y_train) and subject dataset(subject_test)

names(y_test)[names(y_test)=="V1"] <- "activityid"
names(y_train)[names(y_train)=="V1"] <- "activityid"
names(subject_train)[names(subject_train)=="V1"] <- "subjectid"
names(subject_test)[names(subject_test)=="V1"] <- "subjectid"

## substep -Column bind the ActivitiesID and SubjectID to observations dataset X_test ,X_train

combinedtest <- cbind(X_test,y_test,subject_test)
combinedtrain <- cbind(X_train,y_train,subject_train)

## substep -Row bind the test and training data set -Create a total data set of test and train

total <-rbind(combinedtest,combinedtrain)

## Assignment  step 2.Extracts only the measurements on the mean and standard deviation for each measurement.
## Select only those columns which have mean() or std() or activityid or subjectid (added earlier)

selectedcolumns<-grep("mean()|std()|activityid|subjectid",colnames(total),value=TRUE)
total<- total[,selectedcolumns]

## Assignment  step 3.Uses descriptive activity names to name the activities in the data set(essentailly replace acvityid with activity lable)

total$activityid<-as.character(total$activityid)
total$activityid[total$activityid == "1"]<-"WALKING"
total$activityid[total$activityid == "2"]<-"WALKING_UPSTAIRS"
total$activityid[total$activityid == "3"]<-"WALKING_DOWNSTAIRS"
total$activityid[total$activityid == "4"]<-"SITTING"
total$activityid[total$activityid == "5"]<-"STANDING"
total$activityid[total$activityid == "6"]<-"LAYING"
total$activityid<-as.factor(total$activityid)

## Assignment Step 4.Appropriately labels the data set with descriptive variable names.
##  substep -lowercase all the variable names
colnames(total)<-tolower(colnames(total))
## substep -remove underscores(_) 
colnames(total)<-sub("_","",colnames(total))
## substep -remove () from variable names
colnames(total)<-sub("\\()","",colnames(total))
##substep - remove typo bodybody with body (as seen in some of the variable names)
colnames(total)<-sub("bodybody","body",colnames(total))

## Assignment Step 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
## ensure reshape2 package is installed

totalnew<-melt(total,id = c("activityid","subjectid"),measures.vars=c("tbodyacc-mean()-X", "tbodyacc-mean()-Y"))

## please note even though only 2 variables are mentioned in the above statement - measures.vars will take all the other variable in the datasets 
## which are not specifically mentioned as id
## final dataset for submission

finaldataset <-dcast (totalnew, subjectid+ activityid  ~ variable ,mean) 





