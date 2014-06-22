# JHU Data Science Specialization - Getting and Cleaning Data
# Course Project- Tidy Data
# Student: Mark Drummond <8med5@queensu.ca>

# You should create one R script called run_analysis.R that does the following. 
#
#   1. Merges the training and the test sets to create one data set.
#   2. Extracts only the measurements on the mean and standard deviation for 
#     each measurement. 
#   3. Uses descriptive activity names to name the activities in the data set
#   4. Appropriately labels the data set with descriptive variable names. 
#   5. Creates a second, independent tidy data set with the average of each 
#     variable for each activity and each subject. 

run_analysis <- function () {
    # Open and merge (rbind()) the training and test data sets.
    data <- rbind(read.table("data/train/X_train.txt", colClasses = "numeric"),
                  read.table("data/test/X_test.txt", colClasses = "numeric"))

    # We only want columns corresponding to mean() and std() values. The 
    # column numbers can be extracted from the features.txt file, e.g.,
    # "$ egrep 'mean()|std()' features.txt | awk '{ print $1 }'"
    features = c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,
                 240,241,253,254,266:271,294:296,345:350,373:375,424:429,
                 452:454,503,504,513,516,517,526,529,530,539,542,543,552)
    data <- data[,features]
    
    # cbind the activity code and subject number into the first two column
    # positions
    data <- cbind(rbind(read.table("data/train/y_train.txt", colClasses = "numeric"),
                        read.table("data/test/y_test.txt", colClasses = "numeric")),
                  rbind(read.table("data/train/subject_train.txt", colClasses = "numeric"),
                        read.table("data/test/subject_test.txt", colClasses = "numeric")),
                  data)
    
    # Transmogrify the activity code into something more readable
    activities <- read.table("data/activity_labels.txt")
    data[,1] <- factor(data[,1], labels = activities[,2])
    
    # Update the column headers to something more readable
    column.names <- read.table("data/features.txt",
                               colClasses = c("numeric","character"))
    # Remember: features is a vector corresponding to the mean() and std()
    # measurements.
    names(data) <- c("Activity","Subject",column.names[features, 2])
    
    
    #library(plyr)
    #mapvalues(data[,1], activities[,1], activities[,2])
    #head(data[,1],5)
    #data <- sapply(data[,1],function (x) { x <- activities[]})
    print(data[1:2,1:5])
    #print(nrow(data))
    #print(ncol(data))
    
    # create a second data set with the avg of each variable for each activity
    # and each subject
}