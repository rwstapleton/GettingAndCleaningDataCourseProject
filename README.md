# README.md 

## Getting and Cleaning Data
#### getdata-014 - May 2015  

## Course Project  

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This project will be graded by your peers on a series of yes/no questions related to the project.
    
StudentS will be required to submit:     
    1. A tidy data set as described below,    
    2. A link to a Github repository with their script for performing the analysis        
    3. A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data, called *CodeBook.md*.    
    4. A *README.md* should also be included in the repo with the scripts that explains how all of the scripts work and how they are connected.
      
### Create An R Script Named "run_analysis.R" That Does The Following: 
  
    1. Merge the training and the test sets to create one data set.  
    2. Extract only the measurements on the mean and standard deviation for each measurement.  
    3. Use descriptive activity names to name the activities in the data set  
    4. Appropriately labels the data set with descriptive variable names.  
    5. From the data set in step 4   
        * Create a second, independent tidy data set   
        * Average each variable for each activity and each subject
Please upload the tidy data set created in step 5 of the instructions as a txt file created with `write.table()` using `row.name=FALSE` (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

### The Raw Data   

The data set *Human Activity Recognition Using Smartphones Dataset Version 1.0* was obtained by download from the UC Irvine Machine Learning Repository      

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)    

### Data Set Description     

**Abstract:** Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  

**Data Set Characteristics:** Multivariate, Time-Series  

**Number of Instances:** 10299  

**Number of Attributes:** 561  

**Date Donated**  2012-12-10    

**Source:**

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.    
Smartlab - Non Linear Complex Systems Laboratory    
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.    
activityrecognition '@' smartlab.ws    
www.smartlab.ws 

### What's In This Repository    

**CodeBook.md:** Information about raw and tidy data set and transformations made to them.    
**README.md:** This file     
**run_analysis.R:** The R script to transform raw data set into a tidy one     
    
### To Obtain the Tidy Data Set   

**Clone GitHub Repository**   

`git clone https://github.com/rwstapleton/GettingAndCleaningData.git`       

**Download Data Files From:**   
   
**Open R console and Set Working Directory**  

- Use `setwd()` to set working directory to root of the repository  

**Run R Script (Requires Installation of the plyr Package)**   
  
- `source(run_analysis.R)`

**Creates Tidy Data Data Set in Working Directory**   
   
- File named "avgByActSub.txt" contains tidy data    
