## Set Working Directory
setwd("C:/Users/Richie/Documents/MOOCs/Current/getting_and_cleaning_data/GettingAndCleaningDataCourseProject")

## Create Data Directory
if (!file.exists("data")) {
        dir.create("data")
}

## Download Url
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "

## Download Data File
if (!file.exists("./data/Dataset.zip")) {
        download.file(fileUrl, destfile = "./data/Dataset.zip", mode = "wb")
        dateDownloaded <- date()
}

## List Files to Extract
lst <- unzip("./data/Dataset.zip", list=T)[c(1:4,16:18,30:32),1]

## Extract Data Files to Data Directory 
unzip("./data/Dataset.zip", files = lst, exdir = "./data")

################################################################################
##      Step 1 - Merge The Training and Test Sets To Create One Data Set      ##  
################################################################################
        
## Load Training Raw Data Sets
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt") 

## Load Test Raw Data Sets
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## Load Column Label Raw Data Set
colLabels <- read.table("./data/UCI HAR Dataset/features.txt", colClasses = c("character"))

## Merge Data Sets

## Bind Training Data Sets by Column
train <- cbind(cbind(xTrain, subTrain), yTrain)

## Bind Testing Data Sets by Column
test <- cbind(cbind(xTest, subTest), yTest)

## Bind Training and Testing Data Sets by Row
dat <- rbind(train, test)

## Label Columns
colLabels <- rbind(rbind(colLabels, c(562, "SubjectId")), c(563, "ActivityId"))[,2]
names(dat) <- colLabels

## Clean Up Workspace
rm(list=c("colLabels","fileUrl", "lst","subTest","subTrain","test","train",
           "xTest","xTrain","yTest","yTrain"))

################################################################################
## Step 2 - Extract Only The Measurements On The Mean And Standard Deviation  ##
##                           For Each Measurement                             ##  
################################################################################

dat <- dat[,grepl("mean|std|SubjectId|ActivityId", names(dat))]

################################################################################
## Step 3 - Use Descriptive Activity Names For The Activities In The Data Set ##       
################################################################################

## Load Activity Label Raw Data Set and Change Column Names
actLabels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityId", "Activity"))

## Join Activity Names to Data and Insert Descriptive Activity Names
require(plyr)
dat <- join(dat, actLabels, by = "ActivityId", match = "first")

## Remove ActivityId Column
dat <- dat[, -1]

## Reorder Columns Move "SujectId" & "Activity" Columns to First & Second Columns
dat <- dat[, c(80:81,1:79)]

## Clean Up Workspace
rm(list=c("actLabels"))

################################################################################
##   Step 4 - Appropriately Labels Data Set With Descriptive Variable Names   ##       
################################################################################

## Remove Parentheses
names(dat) <- gsub('\\(|\\)',"",names(dat))

## Remove Dashes
names(dat) <- gsub('-',"",names(dat))

## Replace Variable Name Abbreviations with Descriptive Variable Names
names(dat) <- gsub('^t',"TimeDomain.",names(dat))
names(dat) <- gsub('^f',"FrequencyDomain.",names(dat))
names(dat) <- gsub('BodyAcc',"LinearAcceleration.",names(dat))
names(dat) <- gsub('BodyGyro',"AngularVelocity.",names(dat))
names(dat) <- gsub('GravityAcc',"GravityAcceleration.",names(dat))
names(dat) <- gsub('Jerk',"Jerk.",names(dat))
names(dat) <- gsub('Body',"Body.",names(dat))
names(dat) <- gsub('Mag',"Magnitude.",names(dat))
names(dat) <- gsub('mean',"Mean.",names(dat))
names(dat) <- gsub('std',"StandardDeviation.",names(dat))
names(dat) <- gsub('.Freq',".Frequency.",names(dat))

## Remove Any Periods at End of Variable Names 
names(dat) <- gsub('\\.$',"",names(dat))

################################################################################
## Step 5 - From The Step 4 Data Set, Create A Second, Independent Tidy Data  ##
##  Set With The Average Of Each Variable For Each Activity And Each Subject  ##
################################################################################

datAvg <- ddply(dat, c("SubjectId","Activity"), numcolwise(mean))

## Write Data Set to Text File
write.table(datAvg, file = "avgByActSub.txt", row.name=FALSE)

print("Finished, see 'avgByActSub.txt' in your working directory")






