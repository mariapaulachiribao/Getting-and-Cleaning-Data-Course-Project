# download files

Url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(Url, destfile = "C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/Dataset.zip" )

unzip("Dataset.zip")


#read all the tables

test <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/test/X_test.txt")

train <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/train/X_train.txt")

features <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/features.txt")

actcodtest <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/test/y_test.txt")

actcodtrain <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/train/y_train.txt")

subjecttest <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/test/subject_test.txt")

subjecttrain <- read.table("C:/Users/pauch/Desktop/Coursera/Getting and cleaning Data/Week 4/UCI HAR Dataset/train/subject_train.txt")


# add column's names using the table "features"

columnames <- as.vector(features$V2)

names(test) <- columnames

names(train) <- columnames


# add column activity code using the file "y_test" and "y_train"

test <- cbind(test, actcodtest)

setnames(test, "V1", "activitycode")

train <- cbind(train, actcodtrain)

setnames(train, "V1", "activitycode")


# add column subject using the file "subject_test" and "subject_train"

test <- cbind(test, subjecttest)

setnames(test, "V1", "subject")

train <- cbind(train, subjecttrain)

setnames(train, "V1", "subject")


# QUESTION 1 - merge tables train and test

totaltable <- rbind(test, train)


# question 2 - Extracts only the measurements on the mean and standard deviation
# for each measurement.

mean_sd <- totaltable[ ,grepl("[Mm]ean|[Ss]td", names(totaltable))]

tidytable <- cbind(totaltable$subject, totaltable$activitycode, mean_sd)

names(tidytable)[1] <- "subject"
names(tidytable)[2] <- "activity"

# QUESTION 3 - Uses descriptive activity names to name the activities in the data set

tidytable <- mutate(tidytable, 
                    activity = ifelse(activity==1, "walking",
                                      ifelse(activity==2, "walking_upstairs",
                                             ifelse(activity==3,  "walking_downstairs",
                                                    ifelse(activity==4,  "sitting",
                                                           ifelse(activity==5,  "standing",
                                                                  ifelse(activity==6, "laying", activity)))))))

# QUESTION 4 -  Appropriately labels the data set with descriptive variable names.

names(tidytable)<-gsub("Acc", "Accelerometer", names(tidytable))
names(tidytable)<-gsub("Gyro", "Gyroscope", names(tidytable))
names(tidytable)<-gsub("BodyBody", "Body", names(tidytable))
names(tidytable)<-gsub("Mag", "Magnitude", names(tidytable))
names(tidytable)<-gsub("^t", "Time", names(tidytable))
names(tidytable)<-gsub("^f", "Frequency", names(tidytable))
names(tidytable)<-gsub("tBody", "TimeBody", names(tidytable))
names(tidytable)<-gsub("-mean()", "Mean", names(tidytable), ignore.case = TRUE)
names(tidytable)<-gsub("-std()", "STD", names(tidytable), ignore.case = TRUE)
names(tidytable)<-gsub("-freq()", "Frequency", names(tidytable), ignore.case = TRUE)
names(tidytable)<-gsub("angle", "Angle", names(tidytable))
names(tidytable)<-gsub("gravity", "Gravity", names(tidytable))


# QUESTION 5 - creates a second, independent tidy data set with the average of
# each variable for each activity and each subject

finaltable <-
        tidytable %>%
        arrange(subject, activity) %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean)) %>%
        print

write.table(finaltable, file = "finaltable.txt", row.names = FALSE)