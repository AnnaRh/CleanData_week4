#Description of dataset:
Original raw data:  data collected from the accelerometers from the Samsung Galaxy S smartphone.
Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Summary of transformations: train and test data are combined, mean and std variables are extracted.

////////////////////////
#Summary of transformations:
1. Read raw data into R
2. Building up the data set by merging train and test data, as well as subject and activity dimensions.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Applies descriptive activity names to name the activities in the data set
5. Lables dataset with descriptive variable names.
6. Creates a new, independent tidy data set with the average of each variable for each activity and each subject.
7. Writes two datasets into csv files.

///////////////////////
#Description of variables:
 [1] "subject": 30 volunteers of the experiment within an age bracket of 19-48 years
 [2] "activity": activity, performed while wearing the smartphone.
 
 The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
 [3] "timeBodyAccelerometer-mean()-X"                  
 [4] "timeBodyAccelerometer-mean()-Y"                  
 [5] "timeBodyAccelerometer-mean()-Z"                  
 [6] "timeBodyAccelerometer-std()-X"                   
 [7] "timeBodyAccelerometer-std()-Y"                   
 [8] "timeBodyAccelerometer-std()-Z"                   
 [9] "timeGravityAccelerometer-mean()-X"               
[10] "timeGravityAccelerometer-mean()-Y"               
[11] "timeGravityAccelerometer-mean()-Z"               
[12] "timeGravityAccelerometer-std()-X"                
[13] "timeGravityAccelerometer-std()-Y"                
[14] "timeGravityAccelerometer-std()-Z"                
[15] "timeBodyAccelerometerJerk-mean()-X"              
[16] "timeBodyAccelerometerJerk-mean()-Y"              
[17] "timeBodyAccelerometerJerk-mean()-Z"              
[18] "timeBodyAccelerometerJerk-std()-X"               
[19] "timeBodyAccelerometerJerk-std()-Y"               
[20] "timeBodyAccelerometerJerk-std()-Z"               
[21] "timeBodyGyroscope-mean()-X"                      
[22] "timeBodyGyroscope-mean()-Y"                      
[23] "timeBodyGyroscope-mean()-Z"                      
[24] "timeBodyGyroscope-std()-X"                       
[25] "timeBodyGyroscope-std()-Y"                       
[26] "timeBodyGyroscope-std()-Z"                       
[27] "timeBodyGyroscopeJerk-mean()-X"                  
[28] "timeBodyGyroscopeJerk-mean()-Y"                  
[29] "timeBodyGyroscopeJerk-mean()-Z"                  
[30] "timeBodyGyroscopeJerk-std()-X"                   
[31] "timeBodyGyroscopeJerk-std()-Y"                   
[32] "timeBodyGyroscopeJerk-std()-Z"                   
[33] "timeBodyAccelerometerMag-mean()"                 
[34] "timeBodyAccelerometerMag-std()"                  
[35] "timeGravityAccelerometerMag-mean()"              
[36] "timeGravityAccelerometerMag-std()"               
[37] "timeBodyAccelerometerJerkMag-mean()"             
[38] "timeBodyAccelerometerJerkMag-std()"              
[39] "timeBodyGyroscopeMag-mean()"                     
[40] "timeBodyGyroscopeMag-std()"                      
[41] "timeBodyGyroscopeJerkMag-mean()"                 
[42] "timeBodyGyroscopeJerkMag-std()"                  
[43] "frequencyBodyAccelerometer-mean()-X"             
[44] "frequencyBodyAccelerometer-mean()-Y"             
[45] "frequencyBodyAccelerometer-mean()-Z"             
[46] "frequencyBodyAccelerometer-std()-X"              
[47] "frequencyBodyAccelerometer-std()-Y"              
[48] "frequencyBodyAccelerometer-std()-Z"              
[49] "frequencyBodyAccelerometer-meanFreq()-X"         
[50] "frequencyBodyAccelerometer-meanFreq()-Y"         
[51] "frequencyBodyAccelerometer-meanFreq()-Z"         
[52] "frequencyBodyAccelerometerJerk-mean()-X"         
[53] "frequencyBodyAccelerometerJerk-mean()-Y"         
[54] "frequencyBodyAccelerometerJerk-mean()-Z"         
[55] "frequencyBodyAccelerometerJerk-std()-X"          
[56] "frequencyBodyAccelerometerJerk-std()-Y"          
[57] "frequencyBodyAccelerometerJerk-std()-Z"          
[58] "frequencyBodyAccelerometerJerk-meanFreq()-X"     
[59] "frequencyBodyAccelerometerJerk-meanFreq()-Y"     
[60] "frequencyBodyAccelerometerJerk-meanFreq()-Z"     
[61] "frequencyBodyGyroscope-mean()-X"                 
[62] "frequencyBodyGyroscope-mean()-Y"                 
[63] "frequencyBodyGyroscope-mean()-Z"                 
[64] "frequencyBodyGyroscope-std()-X"                  
[65] "frequencyBodyGyroscope-std()-Y"                  
[66] "frequencyBodyGyroscope-std()-Z"                  
[67] "frequencyBodyGyroscope-meanFreq()-X"             
[68] "frequencyBodyGyroscope-meanFreq()-Y"             
[69] "frequencyBodyGyroscope-meanFreq()-Z"             
[70] "frequencyBodyAccelerometerMag-mean()"            
[71] "frequencyBodyAccelerometerMag-std()"             
[72] "frequencyBodyAccelerometerMag-meanFreq()"        
[73] "frequencyBodyBodyAccelerometerJerkMag-mean()"    
[74] "frequencyBodyBodyAccelerometerJerkMag-std()"     
[75] "frequencyBodyBodyAccelerometerJerkMag-meanFreq()"
[76] "frequencyBodyBodyGyroscopeMag-mean()"            
[77] "frequencyBodyBodyGyroscopeMag-std()"             
[78] "frequencyBodyBodyGyroscopeMag-meanFreq()"        
[79] "frequencyBodyBodyGyroscopeJerkMag-mean()"        
[80] "frequencyBodyBodyGyroscopeJerkMag-std()"         
[81] "frequencyBodyBodyGyroscopeJerkMag-meanFreq()"    