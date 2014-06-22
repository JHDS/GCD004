# README.md

## Project Instructions
You should create one R script called 'run_analysis.R' that does the following. 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## run_analysis.R

### Part 1 - Cleaning the Data

1. Concatenate the test and training sets (rbind).
2. Extract on those features (columns) we are interested in.
3. Add columns for the activity code and subject code (cbind, rbind).
4. Convert the activity code to a human readable label (factor).
5. Update the column headers.
6. Write the data to a file.

### Part 2 - Calculating means()

1. Looping over the number of subject and the activities:
2. Extract the subset of data for each subject-activity pair.
3. Calculate the column means and add the results to a data data frame.
4. Add the subject and activity columns.
5. Add the column headers.
6. Write to a file.

## Notes

### mean() and std() Columns

Only those features whose feature names end in "mean()" or "std()" we included
in the analysis. There are other features which also represent variations on
mean or standard deviation calculations, but these were left out for this
exercise. If these features are of interest, it is sufficient to add their
column position to the "features" vector in run_analysis.R.

### Variable (Column/Feature) Names

Column headers were added to the data set to make clear what the measurements
in each column represent. The column headers were taken directly from the
features.txt file. More descriptive names may have been appropriate but would
require some degree of interpretation. I have adopted the position that such
interpretation should be left to a domain expert. The labels from the
features.txt file will be meaningful to any domain expert familiar with the
data set.

### Reading the Tidy Data

Both tidy data sets are CSV files with a row of column headers. The data sets
can be read into R as follows:

    my.data <- read.csv("/path/to/file", header=TRUE)

