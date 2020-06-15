The run_analysis.R script performs the data preparation and then followed by the 5 steps required as described
in the course project’s definition.

1- Download the dataset:
Dataset downloaded and extracted under the folder called UCI HAR Dataset

2- Assign each data to variables:
test <- X_text.txt - 2941 rows, 561 columns.
contains recorded features test data

train <- X_train.txt - 7352 rows, 561 columns.
contains recorded features train data

features <- features.txt - 561 rows, 2 columns.
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

actcodtest <- y_test.txt - 2947 rows, 1 column.
contains test data of activities’code labels

actcodtrain <- y_train.txt -7352 rows, 1 column.
contains test data of activities’code labels

subjecttest <- subject_text.txt - 2947 rows, 1 column.
contains train data of 9/30 volunteer subjects being observed

subjecttrain <- 7552 rows, 1 column.
contains train data of 21/30 volunteer subjects being observed

3- add column's names using the table "features" - to the tables train and test.

4- add column activity code to the tables train and test 
using the function "cbind"

5- add column subject to the tables train and test
using the function "cbind"

6- merge the tables train and test - ANSWER TO QUESTION 1
using "rbind" - result: "totaltable"

7- Extracts only the measurements on the mean and standard deviation for each measurement - ANSWER TO QUESTION 2
filter using function "grepl" - result: "tidytable"

8- Uses descriptive activity names to name the activities in the data set - ANSWER TO QUESTION 3
using the function "mutate" and "ifelse"

9- Appropriately labels the data set with descriptive variable names - ANSWER TO QUESTION 4
using the function "gsub" and what I learned about metacharacters.

10- creates a second, independent tidy data set with the average of each variable for each activity and each subject
ANSWER TO QUESTION 5
using "group_by" and "summarise_each" - result: "finaltable"

11- create a txt.file with the final table.
using the function "write.table"


The tidy table contains 180 rows and 88 columns.

Each row contains the information of one subject and one type of activity, each subject performs 6 types of activities, for this reason
the table contains 6 rows per subject.

The columns contains the next variables:

1- Subject: volunteers in the experiment, 30 people within the age of 19-48 years.
2- Activity: Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3- TimeBodyAccelerometerMean()-X                     
4- TimeBodyAccelerometerMean()-Y                    
5- TimeBodyAccelerometerMean()-Z
6- TimeBodyAccelerometerSTD()-X
7- TimeBodyAccelerometerSTD()-Y
8- TimeBodyAccelerometerSTD()-Z
9- TimeGravityAccelerometerMean()-X
10- TimeGravityAccelerometerMean()-Y
11- TimeGravityAccelerometerMean()-Z
12- TimeGravityAccelerometerSTD()-X
13- TimeGravityAccelerometerSTD()-Y
14- TimeGravityAccelerometerSTD()-Z
15- TimeBodyAccelerometerJerkMean()-X
16- TimeBodyAccelerometerJerkMean()-Y
17- TimeBodyAccelerometerJerkMean()-Z
18- TimeBodyAccelerometerJerkSTD()-X
19- TimeBodyAccelerometerJerkSTD()-Y
20- TimeBodyAccelerometerJerkSTD()-Z
21- TimeBodyGyroscopeMean()-X
22- TimeBodyGyroscopeMean()-Y
23- TimeBodyGyroscopeMean()-Z
24- TimeBodyGyroscopeSTD()-X
25- TimeBodyGyroscopeSTD()-Y
26- TimeBodyGyroscopeSTD()-Z
27- TimeBodyGyroscopeJerkMean()-X
28- TimeBodyGyroscopeJerkMean()-Y
29- TimeBodyGyroscopeJerkMean()-Z
30- TimeBodyGyroscopeJerkSTD()-X
31- TimeBodyGyroscopeJerkSTD()-Y
32- TimeBodyGyroscopeJerkSTD()-Z
33- TimeBodyAccelerometerMagnitudeMean()
34- TimeBodyAccelerometerMagnitudeSTD()
35- TimeGravityAccelerometerMagnitudeMean()
36- TimeGravityAccelerometerMagnitudeSTD()
37- TimeBodyAccelerometerJerkMagnitudeMean()
38- TimeBodyAccelerometerJerkMagnitudeSTD()
39- TimeBodyGyroscopeMagnitudeMean()
40- TimeBodyGyroscopeMagnitudeSTD()
41- TimeBodyGyroscopeJerkMagnitudeMean()
42- TimeBodyGyroscopeJerkMagnitudeSTD()
43- FrequencyBodyAccelerometerMean()-X
44- FrequencyBodyAccelerometerMean()-Y
45- FrequencyBodyAccelerometerMean()-Z
46- FrequencyBodyAccelerometerSTD()-X
47- FrequencyBodyAccelerometerSTD()-Y
48- FrequencyBodyAccelerometerSTD()-Z
49- FrequencyBodyAccelerometerMeanFreq()-X
50- FrequencyBodyAccelerometerMeanFreq()-Y
51- FrequencyBodyAccelerometerMeanFreq()-Z
52- FrequencyBodyAccelerometerJerkMean()-X
53- FrequencyBodyAccelerometerJerkMean()-Y
54- FrequencyBodyAccelerometerJerkMean()-Z
55- FrequencyBodyAccelerometerJerkSTD()-X
56- FrequencyBodyAccelerometerJerkSTD()-Y
57- FrequencyBodyAccelerometerJerkSTD()-Z
58- FrequencyBodyAccelerometerJerkMeanFreq()-X
59- FrequencyBodyAccelerometerJerkMeanFreq()-Y
60- FrequencyBodyAccelerometerJerkMeanFreq()-Z
61- FrequencyBodyGyroscopeMean()-X
62- FrequencyBodyGyroscopeMean()-Y
63- FrequencyBodyGyroscopeMean()-Z
64- FrequencyBodyGyroscopeSTD()-X
65- FrequencyBodyGyroscopeSTD()-Y
66- FrequencyBodyGyroscopeSTD()-Z
67- FrequencyBodyGyroscopeMeanFreq()-X
68- FrequencyBodyGyroscopeMeanFreq()-Y
69- FrequencyBodyGyroscopeMeanFreq()-Z
70- FrequencyBodyAccelerometerMagnitudeMean()
71- FrequencyBodyAccelerometerMagnitudeSTD()
72- FrequencyBodyAccelerometerMagnitudeMeanFreq()
73- FrequencyBodyAccelerometerJerkMagnitudeMean()
74- FrequencyBodyAccelerometerJerkMagnitudeSTD()
75- FrequencyBodyAccelerometerJerkMagnitudeMeanFreq()
76- FrequencyBodyGyroscopeMagnitudeMean()
77- FrequencyBodyGyroscopeMagnitudeSTD()
78- FrequencyBodyGyroscopeMagnitudeMeanFreq()
79- FrequencyBodyGyroscopeJerkMagnitudeMean()
80- FrequencyBodyGyroscopeJerkMagnitudeSTD()
81- FrequencyBodyGyroscopeJerkMagnitudeMeanFreq()
82- Angle(TimeBodyAccelerometerMean,Gravity)
83- Angle(TimeBodyAccelerometerJerkMean),GravityMean)
84- Angle(TimeBodyGyroscopeMean,GravityMean)
85- Angle(TimeBodyGyroscopeJerkMean,GravityMean)
86- Angle(X,GravityMean)
87- Angle(Y,GravityMean)
88- Angle(Z,GravityMean)

