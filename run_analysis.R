# JHU Data Science Specialization - Getting and Cleaning Data
# Course Project- Tidy Data
# Student: Mark Drummond <8med5@queensu.ca>

#####
# PART 1 - Cleaning up the source data

# Merge the training and test data sets.
my.data <- rbind(read.table("data/train/X_train.txt", colClasses = "numeric"),
                 read.table("data/test/X_test.txt", colClasses = "numeric"))

# We only want columns corresponding to mean() and std() values. The 
# column numbers can be extracted from the features.txt file using egrep
# as follows:
#
#     $ egrep 'mean()|std()' features.txt | awk '{ print $1 }'
#
features = c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,
             240,241,253,254,266:271,294:296,345:350,373:375,424:429,
             452:454,503,504,513,516,517,526,529,530,539,542,543,552)
my.data <- my.data[,features]

# cbind() the subject and activity codes into the lead column positions. As we
# did for the data sets, we rbind() the train and test files together, and then
# cbind() the results to our data set.
my.data <- cbind(rbind(read.table("data/train/subject_train.txt", colClasses = "numeric"),
                       read.table("data/test/subject_test.txt", colClasses = "numeric")),
                 rbind(read.table("data/train/y_train.txt", colClasses = "numeric"),
                       read.table("data/test/y_test.txt", colClasses = "numeric")),
                 my.data)

# Transmogrify the subject and activity codes into factors, swapping the
# activity code for its descriptive name from the activity_labels.txt file.
activities <- read.table("data/activity_labels.txt")
my.data[,2] <- factor(my.data[,2], labels = activities[,2])
my.data[,1] <- factor(my.data[,1])

# Update the column headers to something more readable
column.names <- read.table("data/features.txt",
                           colClasses = c("numeric","character"))
# Remember: features is a vector established above corresponding to the
# mean() and std() measurements.
names(my.data) <- c("Subject","Activity",column.names[features, 2])

write.table(my.data, file="GCD004-part1.csv", sep=",", row.names=FALSE)

#print(my.data[1:5,1:5])
#print(dim(my.data))

#####
# PART 2 - Table of Averages
# create a second data set with the avg of each variable for each activity
# and each subject.

# starting point: my.data is a tidy data set representing four dimensions of
# data: a two dimensional matrix of data points for each combination of one of
# 30 subjects and one of 6 activities.

# end result: A two dimensional data set, 1 row per subject-activity pair with
# mean() values for each feature

# for each subject:
#   for each activity:
#     calculate the mean of each feature vector
#     rbind the results to the new data set

my.data2 <- data.frame()
for (subject in c(1:30)) {
    for (activity in activities[,2]) {
        my.subset <- my.data[my.data$Subject==subject & my.data$Activity==activity,-c(1:2)]
        my.data2 <- rbind(my.data2,as.numeric(colMeans(my.subset)))
    }
}

# Append the Subject and Activity columns and the column headers
my.data2 <- cbind(rep(1:30, each=6),rep(as.character(activities[,2]),6),my.data2)
names(my.data2) <- c("Subject","Activity",column.names[features, 2])

write.table(my.data2, file="GCD004-part2.csv", sep=",", row.names=FALSE)
