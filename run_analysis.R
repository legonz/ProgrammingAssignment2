## run_analysis.R
## ------------------------------------------------------------------------------
## PROJECT Week 3 of course GETTING AND CLEANING DATA
## By: Leslie Gonzalez Castillo
## from: Costa Rica - Central America
## ------------------------------------------------------------------------------
## 0. Introduction

## Downloading the Data for the project

## This part of the script is only needed the first time I run the program
## so I use the file.exists() function to be sure if the file was unzip before,
## this control is very important because downloading part consume a lot of time
if(!file.exists("./UCI HAR Dataset")){
        ## This is a quick way to download the Dataset.zip
        url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        name<-"DataProject.zip"
        download.file(url, dest = name)
        unzip(name)  
}

## Reading the diferent variables of interest

## Reading the training data set
Dtrain<-read.table("./UCI HAR Dataset/train/X_train.txt")
## Reading the activity of the train data set
Actlabeltrain<-read.table("./UCI HAR Dataset/train/Y_train.txt")
## Reading the test data set
Dtest<-read.table("./UCI HAR Dataset/test/X_test.txt")
## Reading the activity of the test data set
Actlabeltest<-read.table("./UCI HAR Dataset/test/Y_test.txt")
## Reading the label of the variables in the data set
Dvariables<-read.table("./UCI HAR Dataset/features.txt")
## Reading the activity label names in the data set
Actnames<-read.table("./UCI HAR Dataset/activity_labels.txt")
## Reading the subject train in the data set
Subj_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
## Reading the subject test in the data set
Subj_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
## ------------------------------------------------------------------------------
## 1. Merges the training and the test to create one data set
Data_set<-rbind(Dtrain,Dtest)
## ------------------------------------------------------------------------------
## 2. Extracts only the measurements on the mean and standart desviation for each
## measurement

## Find the the label of the variables measurement that have mean(), std() and
## the term Mean; I use for it the command grep
prueba1<-grep("mean", Dvariables[,2])
prueba2<-grep("std", Dvariables[,2])
prueba3<-grep("Mean", Dvariables[,2])
## Build a Extracts Index
ExIndex<-sort(c(prueba1, prueba2, prueba3))
## I Extract the measurements on the mean and standart desviation
Data_set_mean_std<-Data_set[,ExIndex]
## ------------------------------------------------------------------------------
## 3. Uses descriptive activity names for the activities in the data set

## First I merge activities labels in train and test to build activity labels
## Actlabel variable
Actlabel<-rbind(Actlabeltrain,Actlabeltest)
## Second I merge the activity names and the activity label in the variable
## Activities, it describe the activities as required
Activities=merge(Actnames,Actlabel)
## ------------------------------------------------------------------------------
## 4. Appropiately label the data set with descriptive variables names

## Descriptive variable names not yet easy to undestand
Descr_Activ_names<-Dvariables[ExIndex,]

## remove () using the concept of regular expression syntax with \\
Descr_Activ_names[,2]<-gsub("\\(\\)", "", Descr_Activ_names[,2])

## remove - using the concept of regular expression syntax with \\
Descr_Activ_names[,2]<-gsub("\\-", " ", Descr_Activ_names[,2])

## Label the data set with descriptive variables names as easy as possible
## to understand
colnames(Data_set_mean_std)<-Descr_Activ_names[,2]
## ------------------------------------------------------------------------------
## First Tidy data set as describe in the steps above

## Some steps more before

## Delete the colum 1 of Activities
Activities$V1<-NULL
## Label the activities set with descriptive variables names as easy as possible
## to understand
colnames(Activities)<-c("perform_activity")

## Merges the training and the test subject id to create one subject id data set
Subj_id<-rbind(Subj_train,Subj_test)
## Label the activities set with descriptive variables names as easy as possible
## to understand
colnames(Subj_id)<-c("Subject_id")

## Tidy data set as describe in the project instructions 1,2,3 and 4
Tidy_Dt_set<-cbind(Subj_id,Activities,Data_set_mean_std)

## Output of the Tidy data set
## The output can´t have extension .csv for the proper work in the coursera
## submisión system, so the extension must be .txt
write.table(Tidy_Dt_set, file = "Tidy_First.txt", sep = ",", col.names = NA, 
            qmethod = "double")
## As a test for reading the Tidy data set created
## I perform the command
## Prueba_CSV<-read.csv("./Tidy_First.txt")
## It work fine in my computer...

## ------------------------------------------------------------------------------
## 5. Create a second Tidy data set
## independent tidy data set with the average of each variables for each activity

## Changing the Data_set_mean_std column names
colnames(Data_set_mean_std)<-paste("ave",Descr_Activ_names[,2], sep=" ")
## rewriting Tidy Data set with the change in the Data set column names
Tidy_Dt_set<-cbind(Subj_id,Activities,Data_set_mean_std)

## Second Tidy Data set
Tidy_Dt_set2<-aggregate(Tidy_Dt_set[,3:88], list(Subject_id=Tidy_Dt_set$Subject_id, Perform_Activity=Tidy_Dt_set$perform_activity), mean, na.rm=TRUE)


