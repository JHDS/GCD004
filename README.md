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

    Concatenate the test and training sets (rbind).
    Extract on those features (columns) we are interested in.
    Add columns for the activity code and subject code (cbind, rbind).
    Convert the activity code to a human readable label (factor).
    Update the column headers.
    Write the data to a file.

### Part 2 - Calculating means()

## Notes

### mean() and std() Columns

Only those features whose feature names end in "mean()" or "std()" we included in the
analysis.

### Variable (Column/Feature) Names

Column headers were added to the data set to make clear what the measurements
in each column represent. The column headers were taken directly from the
features.txt file. More descriptive names may have been appropriate but would
require some degree of interpretation. I have adopted the position that such
interpretation should be left to a domain expert. The labels from the
features.txt file will be meaningful to any domain expert familiar with the
data set.

