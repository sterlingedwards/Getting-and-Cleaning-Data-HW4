# Getting-and-Cleaning-Data-HW4
Week 4 assignment in Getting and Cleaning Data

README.md
This github repository contains the following files:
df2.txt - a dataset created from the UCI HAR Dataset, described in further detail below
run_analysis.R - a script created in R that organized and generated df2 including notes in each step. 
df2_Codebook.Rmd - a markdown file with descriptions and summaries of the data included in df2
hw4.read.me.txt - ReadMe explaining the process of creating df2 also included below


The included dataset "df2.txt" uses data from the UCI HAR Dataset as part of the 
Getting and Cleaning Data Course Project. The table can be read into R by 
executing the following code:

        df2 <- read.table("https://s3.amazonaws.com/coursera-uploads/peer-review/3646606c0d391c8250c1d726235e6c2f/df2.txt", header = TRUE) 
                View(df2)

The dataset was created from the UCI HAR Dataset using the script:
"run_analysis.R" included in the github repository. 

The script includes notes about the code. It begins by merging the various
observations and variables into a tidy dataset. All columns are then 
appropriately labelled. 

The variables were then subsetted to include only the mean and standard 
deviation for each variable. The integer values for df2$activity were then 
replaced with descriptive activity titles. 

From this organized dataset, a second dataset "df2.txt" was created by first 
melting the dataset by subject and activity. The dataset was then recast
including the mean of each variable by each subject and activity. Such that 
there were then 180 (30 subjects * 6 activities) observations of 66 variables. 
