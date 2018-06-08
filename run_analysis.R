##run_analysis.R script
##Set wd to "~/UCI HAR Dataset" containing the unzipped data  files.

##Necesary Packages loaded
library(dplyr)
library(tidyr)
library(reshape2)

##Parts 1 and 4: Data merged into a single data.frame with descriptive var names
##features.txt read in and stored as "variable_names" to be used for col.names
features <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
variable_names <- features$V2

##Test data read into R and subject, x, and y combined 
xtest <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = variable_names)
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(subject_test, ytest, xtest)

##Train data read into R and subject, x, and y combined
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = variable_names)
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(subject_train, ytrain, xtrain)

##Train and Test data.frames combined and column names 1 and 2 added. 
df_train_test <- rbind(train, test)
colnames(df_train_test)[1:2] <- c("subject", "activity")


##Part 2: Extract mean and standard deviation for each variable
##(Note: I excluded meanFrequency variables by using ".mean.")
df_mean_std <- select(df_train_test, c(1:2, contains(".mean."), contains("std")))


##Part 3 
##Added descriptive activity names to df_mean_std$activity 
df_mean_std$activity <- plyr::mapvalues(df_mean_std$activity, 
                                        from = c(1L,2L,3L,4L,5L,6L), 
                                        to = c("walking", "walking_upstairs", 
                                               "walking_downstairs", "sitting", 
                                               "standing", "laying"))
##Stored first dataframe as object df1
df1 <- df_mean_std 

##Part 5
##Second dataframe created and stored as object df2
dfmelt <- melt(df1, id = c("subject", "activity"), measure.vars = 3:68)
df2 <- dcast(dfmelt, subject + activity ~ variable, mean)

##Write.table 
write.table(df2, file = "UCI HAR Dataset/df2_.txt", row.names = FALSE)