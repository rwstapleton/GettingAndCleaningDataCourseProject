## Getting and Cleaning Data
#### getdata-014 - May 2015 

# CodeBook  

# The Raw Data 

The raw data was obtained from the [UC Irvine Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html).   
The Human Activity Recognition Using Smartphones Data Set <a href="#one">[1]</a> the folder was downloaded from:  
- [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)   
The Data Set Description can be viewed at:   
- [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)       

## Data Set Description     

**Abstract:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  

**Data Set Characteristics:** Multivariate, Time-Series  

**Number of Instances:** 10299  

**Number of Attributes:** 561  
    
## Study Design:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (`WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING`) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer <a href="#twelve">[12]</a> and gyroscope <a href="#thirteen">[13]</a>) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
    
    
## Attribute Information:

For each record in the dataset it is provided:   

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## The dataset includes the following files:

- **'README.txt'**

- **'features_info.txt':** Shows information about the variables used on the feature vector.

- **'features.txt':** List of all features.

- **'activity_labels.txt':** Links the class labels with their activity name.

- **'train/X_train.txt':** Training set.

- **'train/y_train.txt':** Training labels.

- **'test/X_test.txt':** Test set.

- **'test/y_test.txt':** Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- **'train/subject_train.txt'**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- **'train/Inertial Signals/total_acc_x_train.txt':** The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the **'total_acc_x_train.txt'** and **'total_acc_z_train.txt'** files for the Y and Z axis. 

- **'train/Inertial Signals/body_acc_x_train.txt':** The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- **'train/Inertial Signals/body_gyro_x_train.txt':** The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

## Feature Selection    
   
The features selected for this database come from the accelerometer <a href="#twelve">[12]</a> and gyroscope <a href="#thirteen">[13]</a> 3-axial raw signals `tAcc-XYZ` and `tGyro-XYZ`. These time domain signals (prefix `t` to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (`tBodyAcc-XYZ` and `tGravityAcc-XYZ`) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.     
     
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (`tBodyAccJerk-XYZ` and `tBodyGyroJerk-XYZ`). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (`tBodyAccMag`, `tGravityAccMag`, `tBodyAccJerkMag`, `tBodyGyroMag`, `tBodyGyroJerkMag`).      
     
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing `fBodyAcc-XYZ`, `fBodyAccJerk-XYZ`, `fBodyGyro-XYZ`, `fBodyAccJerkMag`, `fBodyGyroMag`, `fBodyGyroJerkMag`. (Note the `f` to indicate frequency domain signals).      
     
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.     

```
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
```

The set of variables that were estimated from these signals are:     

**mean():** Mean value    
**std():** Standard deviation    
**mad():** Median absolute deviation      
**max():** Largest value in array    
**min():** Smallest value in array    
**sma():** Signal magnitude area    
**energy():** Energy measure. Sum of the squares divided by the number of values.     
**iqr():** Interquartile range     
**entropy():** Signal entropy    
**arCoeff():** Autorregresion coefficients with Burg order equal to 4    
**correlation()**: correlation coefficient between two signals    
**maxInds():** index of the frequency component with largest magnitude    
**meanFreq():** Weighted average of the frequency components to obtain a mean frequency    
**skewness():** skewness of the frequency domain signal     
**kurtosis():** kurtosis of the frequency domain signal     
**bandsEnergy():** Energy of a frequency interval within the 64 bins of the FFT of each window.    
**angle():** Angle between to vectors.    
    
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the `angle()` variable:    

```
gravityMean    
tBodyAccMean    
tBodyAccJerkMean    
tBodyGyroMean     
tBodyGyroJerkMean     
```

## Notes:    

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.        
                  
# The Tidy Data       

## Data Set Description   

**Abstract:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. The database was tranformed by running the `run_analysis.R` Script. The `Mean` function was applied to each variable by `SubjectId` and `Activity` to create the tidy data set described below.     

**Data Set Characteristics:** Multivariate, Time-Series  

**Number of Instances:** 180  

**Number of Attributes:** 81  

## The dataset includes the following file:    
     
`avgByActSub.txt`       

## Feature Selection     

```
 [1] SubjectId                                                               
 [2] Activity                                                                
 [3] TimeDomain.LinearAcceleration.Mean.X                                    
 [4] TimeDomain.LinearAcceleration.Mean.Y                                    
 [5] TimeDomain.LinearAcceleration.Mean.Z                                    
 [6] TimeDomain.LinearAcceleration.StandardDeviation.X                       
 [7] TimeDomain.LinearAcceleration.StandardDeviation.Y                       
 [8] TimeDomain.LinearAcceleration.StandardDeviation.Z                       
 [9] TimeDomain.GravityAcceleration.Mean.X                                   
[10] TimeDomain.GravityAcceleration.Mean.Y                                   
[11] TimeDomain.GravityAcceleration.Mean.Z                                   
[12] TimeDomain.GravityAcceleration.StandardDeviation.X                      
[13] TimeDomain.GravityAcceleration.StandardDeviation.Y                      
[14] TimeDomain.GravityAcceleration.StandardDeviation.Z                      
[15] TimeDomain.LinearAcceleration.Jerk.Mean.X                               
[16] TimeDomain.LinearAcceleration.Jerk.Mean.Y                               
[17] TimeDomain.LinearAcceleration.Jerk.Mean.Z                               
[18] TimeDomain.LinearAcceleration.Jerk.StandardDeviation.X                  
[19] TimeDomain.LinearAcceleration.Jerk.StandardDeviation.Y                  
[20] TimeDomain.LinearAcceleration.Jerk.StandardDeviation.Z                  
[21] TimeDomain.AngularVelocity.Mean.X                                       
[22] TimeDomain.AngularVelocity.Mean.Y                                       
[23] TimeDomain.AngularVelocity.Mean.Z                                       
[24] TimeDomain.AngularVelocity.StandardDeviation.X                          
[25] TimeDomain.AngularVelocity.StandardDeviation.Y                          
[26] TimeDomain.AngularVelocity.StandardDeviation.Z                          
[27] TimeDomain.AngularVelocity.Jerk.Mean.X                                  
[28] TimeDomain.AngularVelocity.Jerk.Mean.Y                                  
[29] TimeDomain.AngularVelocity.Jerk.Mean.Z                                  
[30] TimeDomain.AngularVelocity.Jerk.StandardDeviation.X                     
[31] TimeDomain.AngularVelocity.Jerk.StandardDeviation.Y                     
[32] TimeDomain.AngularVelocity.Jerk.StandardDeviation.Z                     
[33] TimeDomain.LinearAcceleration.Magnitude.Mean                            
[34] TimeDomain.LinearAcceleration.Magnitude.StandardDeviation               
[35] TimeDomain.GravityAcceleration.Magnitude.Mean                           
[36] TimeDomain.GravityAcceleration.Magnitude.StandardDeviation              
[37] TimeDomain.LinearAcceleration.Jerk.Magnitude.Mean                       
[38] TimeDomain.LinearAcceleration.Jerk.Magnitude.StandardDeviation          
[39] TimeDomain.AngularVelocity.Magnitude.Mean                               
[40] TimeDomain.AngularVelocity.Magnitude.StandardDeviation                  
[41] TimeDomain.AngularVelocity.Jerk.Magnitude.Mean                          
[42] TimeDomain.AngularVelocity.Jerk.Magnitude.StandardDeviation             
[43] FrequencyDomain.LinearAcceleration.Mean.X                               
[44] FrequencyDomain.LinearAcceleration.Mean.Y                               
[45] FrequencyDomain.LinearAcceleration.Mean.Z                               
[46] FrequencyDomain.LinearAcceleration.StandardDeviation.X                  
[47] FrequencyDomain.LinearAcceleration.StandardDeviation.Y                  
[48] FrequencyDomain.LinearAcceleration.StandardDeviation.Z                  
[49] FrequencyDomain.LinearAcceleration.Mean.Frequency.X                     
[50] FrequencyDomain.LinearAcceleration.Mean.Frequency.Y                     
[51] FrequencyDomain.LinearAcceleration.Mean.Frequency.Z                     
[52] FrequencyDomain.LinearAcceleration.Jerk.Mean.X                          
[53] FrequencyDomain.LinearAcceleration.Jerk.Mean.Y                          
[54] FrequencyDomain.LinearAcceleration.Jerk.Mean.Z                          
[55] FrequencyDomain.LinearAcceleration.Jerk.StandardDeviation.X             
[56] FrequencyDomain.LinearAcceleration.Jerk.StandardDeviation.Y             
[57] FrequencyDomain.LinearAcceleration.Jerk.StandardDeviation.Z             
[58] FrequencyDomain.LinearAcceleration.Jerk.Mean.Frequency.X                
[59] FrequencyDomain.LinearAcceleration.Jerk.Mean.Frequency.Y                
[60] FrequencyDomain.LinearAcceleration.Jerk.Mean.Frequency.Z                
[61] FrequencyDomain.AngularVelocity.Mean.X                                  
[62] FrequencyDomain.AngularVelocity.Mean.Y                                  
[63] FrequencyDomain.AngularVelocity.Mean.Z                                  
[64] FrequencyDomain.AngularVelocity.StandardDeviation.X                     
[65] FrequencyDomain.AngularVelocity.StandardDeviation.Y                     
[66] FrequencyDomain.AngularVelocity.StandardDeviation.Z                     
[67] FrequencyDomain.AngularVelocity.Mean.Frequency.X                        
[68] FrequencyDomain.AngularVelocity.Mean.Frequency.Y                        
[69] FrequencyDomain.AngularVelocity.Mean.Frequency.Z                        
[70] FrequencyDomain.LinearAcceleration.Magnitude.Mean                       
[71] FrequencyDomain.LinearAcceleration.Magnitude.StandardDeviation          
[72] FrequencyDomain.LinearAcceleration.Magnitude.Mean.Frequency             
[73] FrequencyDomain.Body.LinearAcceleration.Jerk.Magnitude.Mean             
[74] FrequencyDomain.Body.LinearAcceleration.Jerk.Magnitude.StandardDeviation
[75] FrequencyDomain.Body.LinearAcceleration.Jerk.Magnitude.Mean.Frequency   
[76] FrequencyDomain.Body.AngularVelocity.Magnitude.Mean                     
[77] FrequencyDomain.Body.AngularVelocity.Magnitude.StandardDeviation        
[78] FrequencyDomain.Body.AngularVelocity.Magnitude.Mean.Frequency           
[79] FrequencyDomain.Body.AngularVelocity.Jerk.Magnitude.Mean                
[80] FrequencyDomain.Body.AngularVelocity.Jerk.Magnitude.StandardDeviation   
[81] FrequencyDomain.Body.AngularVelocity.Jerk.Magnitude.Mean.Frequency       
```   

**TimeDomain** is the analysis of mathematical functions, physical signals or time series of economic or environmental data, with respect to time. <a href="#two">[2]</a>   
**FrequencyDomain** refers to the analysis of mathematical functions or signals with respect to frequency, rather than time. <a href="#three">[3]</a>      
**GravityAcceleration** is the acceleration on an object caused by force of gravity. <a href="#four">[4]</a>    
**LinearAcceleration** is the rate at which the velocity of an object changes over time while moving in one direction. <a href="#five">[5]</a>     
**AngularVelocity** is defined as the rate of change of angular displacement and is a vector quantity which specifies the rotational speed of an object and the axis about which the object is rotating. <a href="#six">[6]</a>      
**Jerk** is the rate of change of acceleration; that is, the derivative of acceleration with respect to time. <a href="#seven">[7]</a>         
**Magnitude** is the size of an object, a property by which the object can be compared as larger or smaller than other objects of the same kind. <a href="#eight">[8]</a>     
**Frequency** is the number of occurrences of a repeating event per unit time. <a href="#nine">[9]</a>       
**StandardDeviation** measures the amount of variation or dispersion from the average. <a href="#ten">[10]</a>      
**Mean** is an average that refers to the sum of a list of numbers divided by the size of the list, in other words the arithmetic mean. <a href="#eleven">[11]</a>     

# References     

 <a id="one">[1]<a/> Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012    
 <a id="two">[2]<a/> [Time Domain](http://en.wikipedia.org/wiki/Time_domain)         
 <a id="three">[3]<a/> [Frequency Domain](http://en.wikipedia.org/wiki/Frequency_domain)        
 <a id="four">[4]<a/> [Gravitational Acceleration](http://en.wikipedia.org/wiki/Gravitational_acceleration)   
 <a id="five">[5]<a/> [Acceleration](http://en.wikipedia.org/wiki/Acceleration)     
 <a id="six">[6]<a/> [Angular Velocity](http://en.wikipedia.org/wiki/Angular_velocity)     
 <a id="seven">[7]<a/> [Jerk](http://en.wikipedia.org/wiki/Jerk_(physics))    
 <a id="eight">[8]<a/> [Magnitude](http://en.wikipedia.org/wiki/Magnitude_(mathematics))     
 <a id="nine">[9]<a/> [Frequency](http://en.wikipedia.org/wiki/Frequency)     
<a id="ten">[10]<a/> [Standard Deviation](http://en.wikipedia.org/wiki/Standard_deviation)     
<a id="eleven">[11]<a/> [Average](http://en.wikipedia.org/wiki/Average)   
<a id="twelve">[12]<a/> [Accelerometer](http://en.wikipedia.org/wiki/Accelerometer)
<a id="thirteen">[13]<a/> [Gyroscope](http://en.wikipedia.org/wiki/Gyroscope)


