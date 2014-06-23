PROJECT Week 3 of course GETTING AND CLEANING DATA
June 2014
By: Leslie Gonzalez Castillo
from: Costa Rica - Central America

The purpose of this project is to demostrate the ability to collect, work with, and clean a data set.
The data linked to from the course website represent data collected from the accelerometers from  the Samsung Galaxy S smartphone.
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
INTRODUCTION
Human Activity Recognition Using Smartphones Dataset
----------------------------------------------------------------------------------
Investigators:
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit?? degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
----------------------------------------------------------------------------------

Data collection description:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
--------------------------------------------------------------------------------
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
--------------------------------------------------------------------------------
Description of the variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in the file 'features.txt'
--------------------------------------------------------------------------------
Describe of transformation
First of all I require Download the Data for the project, use the Download.file() and unzip(). 
Also I implement a control to know in this part  of download and unzip is only doit the first time I run the program so I use the file.exists() function to be sure if the file was unzip before,this control is very important because downloading part consume a lot of time.
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
As required in the project I created the R script called run_analysis.R

In the programming solution I read several Data

Describe the data reading of diferent variables of interest

Dtrain          =Read the training data set in the variable 7352x561
Dtest           =Read the test data set in the variable 2947x561
Actlabeltrain   =Read the activity of the train data set in the variable 7352x1
Actlabeltest    =Read the activity of the test data set in the variable 2947x1
Subj_train      =Read the subject train in the data set in the variable 7352x1
Subj_test       =Read the subject test in the data set in the variable 2947x1
Dvariables      =Read the label of the variables in the data set 561x2
Actnames        =Read the activity label names in the data set 6x2

In the step 1 of run_analysis.R Merge
Data_set        =Merges the training and the test to create one data set

In the step 2 of run_analysis.R Clean up the data as required, Extracts
prueba1,prueba2 and prueba3     =Find the the label of the variables measurement that have mean(), std() and the term Mean; using the command grep
ExIndex         =Build a Extracts Index
Data_set_mean_std= Extract the measurements on the mean and standart desviation for each measuremnt

In the step 3 of run_analysis.R Clean up the data and create descriptive activity names for the activities
Actlabel        =merge activities labels in train and test to build activity labels
Activities      =merge the activity names and the activity label in the variable
it describe the activities as required

In the step 4 of run_analysis.R Appropiately label the data set with descriptive variables names

Descr_Activ_names       =Descriptive variable names not yet easy to undestand
Descr_Activ_names[,2]   =remove () using the concept of regular expression syntax with \\
Descr_Activ_names[,2]   =remove - using the concept of regular expression syntax with \\

colnames(Data_set_mean_std)=Label the data set with descriptive variables names as easy as possible to understand

Prepare the first Tidy data set
Tidy_Dt_set     =Tidy data set build as describe in the project instructions 1,2,3 and 4

the output of the Tidy data set can??t have extension .csv for the proper work in the coursera submisi??n system, so the extension must be .txt
The command

write.table(Tidy_Dt_set, file = "Tidy_First.txt", sep = ",", col.names = NA, 
            qmethod = "double")
            
As a test for reading the Tidy data set created I perform the command

        Prueba_CSV<-read.csv("./Tidy_First.txt")

It work fine...

In the step 5 of run_analysis.R
colnames(Data_set_mean_std) =Changing the Data_set_mean_std column names adding ave to the labels
Tidy_Dt_set     =rewriting Tidy Data set with the change in the Data set column names
Tidy_Dt_set2=Second Tidy Data set using the aggregate() function

